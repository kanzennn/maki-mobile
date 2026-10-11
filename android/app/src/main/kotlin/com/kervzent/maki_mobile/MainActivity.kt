package com.kervzent.maki_mobile

import android.os.Build
import android.os.Bundle
import android.view.View
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // A key from a hardware keyboard or a barcode scanner takes Android
        // out of touch mode, and Android then outlines the focused view: the
        // whole Flutter view. Flutter draws its own focus indicators.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            findViewById<View>(FLUTTER_VIEW_ID)?.defaultFocusHighlightEnabled = false
        }
    }
}
