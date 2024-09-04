import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:printing/printing.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BillScreenState createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: _printBill,
          ),
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: _captureScreenshot,
          ),
        ],
      ),
      body: Screenshot(
        controller: _screenshotController,
        child: _buildBillContent(),
      ),
    );
  }

  Widget _buildBillContent() {
    // Replace with your actual bill content
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bill Summary', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Text('Item 1: \$10.00'),
          Text('Item 2: \$15.00'),
          Text('Total: \$25.00'),
        ],
      ),
    );
  }

  void _captureScreenshot() async {
    final image = await _screenshotController.capture();
    if (image != null) {
      // Save or share the image file
      print('Screenshot captured!');
    }
  }

  void _printBill() async {
    final image = await _screenshotController.capture();
    if (image != null) {
      await Printing.layoutPdf(
        onLayout: (format) async => image,
      );
      print('Bill sent to printer!');
    }
  }
}
