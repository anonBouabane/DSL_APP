import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfUint8ListExample extends StatelessWidget {
  const PdfUint8ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Uint8List Example'),
        actions: [
          IconButton(
            icon:const  Icon(Icons.save),
            onPressed: _generateAndSavePdf,
          ),
        ],
      ),
      body:const Center(
        child: Text('Press the save button to generate PDF as Uint8List.'),
      ),
    );
  }

  void _generateAndSavePdf() async {
    final pdf = _generatePdf();

    // Convert PDF to Uint8List
    final pdfBytes = await pdf.save();

    // Now `pdfBytes` contains the PDF data as a Uint8List
    // You can now save it, send it over the network, or do anything you need

    print('PDF generated as Uint8List with ${pdfBytes.length} bytes.');
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
                pw.Text('Termination Letter', style: pw.TextStyle(fontSize: 24)),
                pw.SizedBox(height: 20),
                pw.Text('Employee Name: John Doe'),
                pw.Text('Position: Software Engineer'),
                pw.Text('Department: IT Department'),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Dear John Doe,',
                  style: pw.TextStyle(fontSize: 18),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'We regret to inform you that your employment with [Company Name] is terminated, effective immediately. This decision has been made due to [reason for termination].',
                  style: pw.TextStyle(fontSize: 14),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'You are required to return all company property and settle any outstanding dues. Your final paycheck will be processed and sent to you within the next [time period].',
                  style: pw.TextStyle(fontSize: 14),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  'We appreciate your contributions to the company and wish you success in your future endeavors.',
                  style: pw.TextStyle(fontSize: 14),
                ),
                pw.SizedBox(height: 40),
                pw.Text('Sincerely,'),
                pw.SizedBox(height: 10),
                pw.Text('HR Department'),
                pw.Text('[Company Name]'),
              ],
            ),
          );
        },
      ),
    );

    return pdf;
  }
}
