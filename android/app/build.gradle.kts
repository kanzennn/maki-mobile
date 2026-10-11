plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.kervzent.maki_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.kervzent.maki_mobile"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildFeatures {
        // The flavors' resValue calls need this since AGP 9.
        resValues = true
    }

    // Run and build with --flavor dev|prod and the matching
    // --dart-define-from-file=env/<flavor>.json.
    flavorDimensions += "env"
    productFlavors {
        create("dev") {
            dimension = "env"
            // Installs next to the prod app.
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "Maki Dev")
        }
        create("prod") {
            dimension = "env"
            resValue("string", "app_name", "Maki")
        }
    }

    buildTypes {
        release {
            // Release signing isn't set up yet (docs/README.md). The debug
            // keys keep `flutter run --release` working until then.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
