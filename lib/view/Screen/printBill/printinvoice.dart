import 'dart:typed_data'; // Correct import for Uint8List

import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';

class SunmiInvoicePrinter {
  Future<void> printImage(Uint8List image) async {
    try {
      // Initialize the printer
      await SunmiPrinter.initPrinter();

      // Print the captured image
      await SunmiPrinter.printImage(image);

      // Optionally, add a line break or other formatting
      await SunmiPrinter.lineWrap(3);
      
      // Use SunmiStyle with printText method
      await SunmiPrinter.printText(
        'Thank you!',
        style: SunmiStyle(align: SunmiPrintAlign.CENTER),
      );

      // Finish the print transaction
      await SunmiPrinter.exitTransactionPrint(true);
    } catch (e) {
      print('Error printing invoice: $e');
    }
  }
}
