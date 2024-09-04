import 'package:dslsale/view/Screen/printBill/printinvoice.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: _captureAndPrintInvoice,
          ),
        ],
      ),
      body: Screenshot(
        controller: _screenshotController,
        child: _buildInvoiceContent(),
      ),
    );
  }

  Widget _buildInvoiceContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
              child: Text('Invoice',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          const SizedBox(height: 20),
          Text('Date: ${DateTime.now().toLocal().toString().split(' ')[0]}'),
          const SizedBox(height: 20),
          const Text('Bill To:'),
          const Text('John Doe'),
          const Text('123 Main Street'),
          const Text('City, State, ZIP'),
          const SizedBox(height: 20),
          const Text('Description',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Divider(),
          _buildInvoiceItem('Item 1', '10.00'),
          _buildInvoiceItem('Item 2', '15.00'),
          const Divider(),
          const SizedBox(height: 10),
          _buildInvoiceItem('Total', '25.00', isBold: true),
        ],
      ),
    );
  }

  Widget _buildInvoiceItem(String name, String price, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text('\$$price',
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  void _captureAndPrintInvoice() async {
    final image = await _screenshotController.capture();
    if (image != null) {
      await   InvoiceItem(name: "asd", quantity: 12, price: 10000);
    }
  }
}
