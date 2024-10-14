import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../data/model/single_order_model.dart';

class InvoicePrintController extends GetxController {
  var isGettingMyProfile = false.obs;

  @override
  void onInit() {
    isGettingMyProfile.value = true;
    super.onInit();
  }

  Rx<SingleOrderModel> singleOrderModel = SingleOrderModel().obs;

  @override
  void onReady() {
    isGettingMyProfile.value = false;
    super.onReady();
  }

  // Method to generate the invoice
  Future<void> generateInvoice() async {
    final Uint8List logoImage = await _getImageFromAsset('assets/image/logo.png');
    final font = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Regular.ttf'));

    // Create PDF document
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              // Header with Logo and Sender Information
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  // Company Logo
                  pw.Image(pw.MemoryImage(logoImage), height: 60),

                  // Invoice Title and Information
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Facture FA2406-0066', style: pw.TextStyle(font: font, fontWeight: pw.FontWeight.bold, fontSize: 14)),
                      pw.Text('Date facturation : 20/06/2024', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Date échéance : 21/06/2024', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Code client : CU2406-00060', style: pw.TextStyle(font: font, fontSize: 10)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Sender and Receiver Information
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  // Sender Address
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('WebMotion', style: pw.TextStyle(font: font, fontWeight: pw.FontWeight.bold, fontSize: 12)),
                      pw.Text('14 rue de Paris', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('20000 Casablanca', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Tél.: 0661541003', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Email: contact@webmotion.ma', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Web: www.webmotion.ma', style: pw.TextStyle(font: font, fontSize: 10)),
                    ],
                  ),

                  // Receiver Address
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Maroc Citrus', style: pw.TextStyle(font: font, fontWeight: pw.FontWeight.bold, fontSize: 12)),
                      pw.Text('Immeuble F, projet le Yacht n° 79,', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Angle bd de la Corniche et rue Abou Waqt', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('20000 Casablanca', style: pw.TextStyle(font: font, fontSize: 10)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Designation Table (Product Info)
              pw.Table.fromTextArray(
                headers: ['Désignation', 'TVA', 'P.U. HT', 'Qté', 'Total HT'],
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
                cellPadding: pw.EdgeInsets.all(7),
                //full height for column content

                data: [
                  [
                    'Hébergement d\'un an pour le site maroc citrus\n(Du 25/05/2024 au 25/05/2025)',
                    '20%',
                    '600,00',
                    '1',
                    '600,00',
                  ],

                  [
                    'Hébergement d\'un an pour le site maroc citrus\n(Du 25/05/2024 au 25/05/2025)',
                    '20%',
                    '600,00',
                    '1',
                    '600,00',
                  ],
                  [
                    'Hébergement d\'un an pour le site maroc citrus\n(Du 25/05/2024 au 25/05/2025)',
                    '20%',
                    '600,00',
                    '1',
                    '600,00',
                  ],
                ],
              ),
              pw.SizedBox(height: 20),

              // Payment Summary
              _buildSummaryRow('Total HT', '600,00', font),
              _buildSummaryRow('Total TVA 20%', '120,00', font),
              _buildSummaryRow('Total TTC', '720,00', font),
              _buildSummaryRow('Payé', '720,00', font, isBold: true),
              _buildSummaryRow('Reste à payer', '0,00', font, isBold: true),
              pw.SizedBox(height: 20),

              // Footer Information
              pw.SizedBox(height: 40),
              pw.Text('Capital de 100 000 MAD - R.C.: 452835', style: pw.TextStyle(font: font, fontSize: 8), textAlign: pw.TextAlign.center),
              pw.Text('I.F.: 52452117 - ICE: 00306243900051', style: pw.TextStyle(font: font, fontSize: 8), textAlign: pw.TextAlign.center),
            ],
          );
        },
      ),
    );

    final bytes = await pdf.save();
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, '_blank');
  }

  // Utility function for fetching an image
  Future<Uint8List> _getImageFromAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    return data.buffer.asUint8List();
  }

  // Utility function to build summary rows
  pw.Widget _buildSummaryRow(String label, String amount, pw.Font font, {bool isBold = false}) {
    return pw.Container(
      margin: pw.EdgeInsets.only(bottom: 5),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(font: font, fontSize: 13, fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.bold)),
          pw.Text(amount, style: pw.TextStyle(font: font, fontSize: 13, fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal)),
        ],
      )
    );
  }
}
