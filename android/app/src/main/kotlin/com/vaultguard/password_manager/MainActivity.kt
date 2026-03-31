package com.vaultguard.password_manager

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.view.WindowManager

class MainActivity : FlutterFragmentActivity() {

    private val CHANNEL = "com.vaultguard/security"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "setFlagSecure" -> {
                        val enable = call.argument<Boolean>("enable") ?: false
                        runOnUiThread {
                            try {
                                if (enable) {
                                    window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
                                } else {
                                    window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                                }
                                result.success(null)
                            } catch (e: Exception) {
                                result.error("FLAG_SECURE_ERROR", e.message, null)
                            }
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }
}
