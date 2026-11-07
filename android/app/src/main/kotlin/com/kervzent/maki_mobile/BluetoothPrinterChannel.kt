package com.kervzent.maki_mobile

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.bluetooth.BluetoothSocket
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.IOException
import java.util.UUID
import java.util.concurrent.Executors

/**
 * The way to a receipt printer over Bluetooth Classic (SPP), for the printers
 * paired in Android's settings. It never scans, so it needs neither the scan
 * nor a location permission (docs/hardware.md). A connection lasts one ticket:
 * many of these printers serve one phone at a time.
 */
internal class BluetoothPrinterChannel(
    private val activity: Activity,
    messenger: BinaryMessenger,
) : MethodChannel.MethodCallHandler {
    private val worker = Executors.newSingleThreadExecutor()
    private val main = Handler(Looper.getMainLooper())

    /** What waits for the user's answer to the permission request. */
    private val waiting = mutableListOf<Pair<() -> Unit, () -> Unit>>()

    init {
        MethodChannel(messenger, CHANNEL).setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "paired" -> withAdapter(result) { adapter -> paired(adapter, result) }
            "send" -> {
                val address = call.argument<String>("address")
                val bytes = call.argument<ByteArray>("bytes")
                if (address == null || bytes == null || !BluetoothAdapter.checkBluetoothAddress(address)) {
                    result.error("send_failed", null, null)
                    return
                }
                withAdapter(result) { adapter -> send(adapter, address, bytes, result) }
            }
            else -> result.notImplemented()
        }
    }

    /** Passes on the answer to a request this channel made. */
    fun onPermissionResult(requestCode: Int, grantResults: IntArray) {
        if (requestCode != PERMISSION_REQUEST) return
        val granted = grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED
        val answered = waiting.toList()
        waiting.clear()
        answered.forEach { (onGranted, onDenied) -> if (granted) onGranted() else onDenied() }
    }

    private fun withAdapter(result: MethodChannel.Result, then: (BluetoothAdapter) -> Unit) {
        withPermission(
            onGranted = {
                val manager = activity.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager?
                val adapter = manager?.adapter
                when {
                    adapter == null -> result.error("unavailable", null, null)
                    !adapter.isEnabled -> result.error("bluetooth_off", null, null)
                    else -> then(adapter)
                }
            },
            onDenied = { result.error("permission_denied", null, null) },
        )
    }

    private fun withPermission(onGranted: () -> Unit, onDenied: () -> Unit) {
        // Before Android 12 the BLUETOOTH permission is granted at install.
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S ||
            activity.checkSelfPermission(Manifest.permission.BLUETOOTH_CONNECT) == PackageManager.PERMISSION_GRANTED
        ) {
            onGranted()
            return
        }
        waiting.add(onGranted to onDenied)
        if (waiting.size == 1) {
            activity.requestPermissions(arrayOf(Manifest.permission.BLUETOOTH_CONNECT), PERMISSION_REQUEST)
        }
    }

    @SuppressLint("MissingPermission") // withPermission has it.
    private fun paired(adapter: BluetoothAdapter, result: MethodChannel.Result) {
        val printers = adapter.bondedDevices
            .orEmpty()
            .map { device -> mapOf("name" to (device.name ?: device.address), "address" to device.address) }
            .sortedBy { it["name"] }
        result.success(printers)
    }

    private fun send(adapter: BluetoothAdapter, address: String, bytes: ByteArray, result: MethodChannel.Result) {
        worker.execute {
            val problem = deliver(adapter, address, bytes)
            main.post {
                if (problem == null) result.success(null) else result.error(problem, null, null)
            }
        }
    }

    /** Null once [bytes] went; otherwise the problem's code. */
    private fun deliver(adapter: BluetoothAdapter, address: String, bytes: ByteArray): String? {
        val socket = try {
            connect(adapter, address)
        } catch (_: IOException) {
            return "connect_failed"
        } catch (_: SecurityException) {
            return "permission_denied"
        }
        return socket.use {
            try {
                val out = it.outputStream
                var at = 0
                while (at < bytes.size) {
                    val count = minOf(CHUNK, bytes.size - at)
                    out.write(bytes, at, count)
                    out.flush()
                    at += count
                }
                // Closing at once can cut off what the printer has yet to read.
                Thread.sleep(DRAIN_MILLIS)
                null
            } catch (_: IOException) {
                "send_failed"
            }
        }
    }

    /** Some cheap printers only take the insecure socket, so that comes second. */
    @SuppressLint("MissingPermission") // withPermission has it.
    private fun connect(adapter: BluetoothAdapter, address: String): BluetoothSocket {
        val device = adapter.getRemoteDevice(address)
        val secure = device.createRfcommSocketToServiceRecord(SPP)
        try {
            secure.connect()
            return secure
        } catch (_: IOException) {
            closeQuietly(secure)
        }
        val insecure = device.createInsecureRfcommSocketToServiceRecord(SPP)
        try {
            insecure.connect()
            return insecure
        } catch (error: IOException) {
            closeQuietly(insecure)
            throw error
        }
    }

    private fun closeQuietly(socket: BluetoothSocket) {
        try {
            socket.close()
        } catch (_: IOException) {
            // It is being given up anyway.
        }
    }

    private companion object {
        const val CHANNEL = "com.kervzent.maki_mobile/printer"
        const val PERMISSION_REQUEST = 4101
        const val CHUNK = 512
        const val DRAIN_MILLIS = 500L

        /** The Serial Port Profile's well-known ID. */
        val SPP: UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB")
    }
}
