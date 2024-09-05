import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Generator'),
      ),
      body: Center(
        child: ElevatedButton(
          child:const Text('Generate Invoice'),
          onPressed: () {
            _generateAndPrintInvoice(context);
          },
        ),
      ),
    );
  }

  Future<void> _generateAndPrintInvoice(BuildContext context) async {
    final pdf = pw.Document();

    // Create PDF content
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Invoice', style:const pw.TextStyle(fontSize: 40)),
              pw.SizedBox(height: 20),
              pw.Text('Invoice Number: 001', style:const pw.TextStyle(fontSize: 18)),
              pw.Text('Date: ${DateTime.now().toString().split(' ')[0]}',
                  style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              pw.Text('Bill To:', style: pw.TextStyle(fontSize: 18)),
              pw.Text('John Doe\n1234 Main Street\nCity, ST 12345',
                  style: pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Text('Items:', style: pw.TextStyle(fontSize: 18)),
              pw.Table.fromTextArray(
                headers: ['Description', 'Quantity', 'Price', 'Total'],
                data: [
                  ['Item 1', '1', '\$50.00', '\$50.00'],
                  ['Item 2', '2', '\$30.00', '\$60.00'],
                  ['Item 3', '3', '\$20.00', '\$60.00'],
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Subtotal:', style: pw.TextStyle(fontSize: 18)),
                  pw.Text('\$170.00', style: pw.TextStyle(fontSize: 18)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Tax (10%):', style: pw.TextStyle(fontSize: 18)),
                  pw.Text('\$17.00', style: pw.TextStyle(fontSize: 18)),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Total:',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.Text('\$187.00',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 40),
              pw.Text('Thank you for your business!',
                  style: pw.TextStyle(fontSize: 18)),
            ],
          );
        },
      ),
    );

    // Save the PDF to a file
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/invoice.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open print preview
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
