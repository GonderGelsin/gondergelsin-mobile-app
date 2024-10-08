package com.example.gondergelsin_mobile_app

import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.gondergelsin_mobile_app/client_id"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger!!, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getClientId") {
                val clientId = getClientId()
                if (clientId != null) {
                    result.success(clientId)
                } else {
                    result.error("UNAVAILABLE", "Client ID not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getClientId(): String? {
        return try {
            val ai: ApplicationInfo = packageManager.getApplicationInfo(packageName, PackageManager.GET_META_DATA)
            val bundle = ai.metaData
            bundle.getString("com.google.android.gms.client_id") // `google-services.json`'dan client_id alınıyor
        } catch (e: PackageManager.NameNotFoundException) {
            e.printStackTrace()
            null
        }
    }
}
