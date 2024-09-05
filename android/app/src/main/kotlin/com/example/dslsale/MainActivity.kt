package com.example.dslsale

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import sunmi.sunmiui.utils.SunmiPrintHelper

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.sunmi_printer/print"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Set up the platform channel for communication between Flutter and native Android
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "printText" -> {
                    val text = call.argument<String>("text") ?: ""
                    printText(text)
                    result.success("Printed successfully")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    // Function to print the text using the Sunmi printer
    private fun printText(text: String) {
        // Initialize the printer (required before printing)
        SunmiPrintHelper.getInstance().initPrinter()

        // Print the passed text
        SunmiPrintHelper.getInstance().printText(text + "\n")

        // Feed the paper after printing
        SunmiPrintHelper.getInstance().feedPaper()
    }
}
