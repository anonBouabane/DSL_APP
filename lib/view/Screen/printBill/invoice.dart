import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPrintScreen extends StatelessWidget {
  const PdfPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Print Example'),
        actions: [
          IconButton(
            icon:const  Icon(Icons.print),
            onPressed: _printPdf,
          ),
        ],
      ),
      body: const Center(
        child: Text('Press the print button to generate and print PDF.'),
      ),
    );
  }

  void _printPdf() async {
    final pdf = _generatePdf();

    // Use the Printing package to print the PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  pw.Document _generatePdf() {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text('Bill Summary', style: pw.TextStyle(fontSize: 24)),
                pw.SizedBox(height: 20),
                pw.Text('Item 1: \$10.00'),
                pw.Text('Item 2: \$15.00'),
                pw.SizedBox(height: 20),
                pw.Text('Total: \$25.00', style: pw.TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );

    return pdf;
  }
}
