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

  Rx<SingleOrderModel> singleOrderModel = SingleOrderModel().obs;

  @override
  void onInit() {
    isGettingMyProfile.value = true;
    super.onInit();
  }

  @override
  void onReady() {
    isGettingMyProfile.value = false;
    super.onReady();
  }

  // Method to generate the invoice
  Future<void> generateInvoice() async {
    final Uint8List logoImage = await _getImageFromAsset('assets/image/logo.png');
    final font = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Regular.ttf'));

    // Fetch values dynamically from singleOrderModel
    final invoiceNumber = singleOrderModel.value.order!.id ?? 'Unknown';
    final billingDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    final dueDate = DateFormat('dd/MM/yyyy').format(DateTime.parse("${singleOrderModel.value.order!.deliveryDate}") ?? DateTime.now());
    final companyName = singleOrderModel.value.order!.company ?? 'Unknown';
    final companyAddress = singleOrderModel.value.order!.userDeliveryAddress!.address ?? 'Unknown';
    final customerName = singleOrderModel.value.order!.company ?? 'Unknown';
    final customerAddress = singleOrderModel.value.order!.userDeliveryAddress!.address! ?? 'Unknown';

    // Generate product table data dynamically
    final products = singleOrderModel.value.order!.products ?? [];

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
                      pw.Text('Facture $invoiceNumber', style: pw.TextStyle(font: font, fontWeight: pw.FontWeight.bold, fontSize: 14)),
                      pw.Text('Date facturation : $billingDate', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Date échéance : $dueDate', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Company : $companyName', style: pw.TextStyle(font: font, fontSize: 10)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Sender and Receiver Information
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  // Sender Address (Static or fetched from company profile)
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('$companyName', style: pw.TextStyle(font: font, fontWeight: pw.FontWeight.bold, fontSize: 12)),
                      pw.Text('${companyAddress}', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('${singleOrderModel.value.order!.userDeliveryAddress!.postCode}, ${singleOrderModel.value.order!.userDeliveryAddress!.city}', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Tél.: ${singleOrderModel.value.order!.userDeliveryAddress!.phone}', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Contact: ${singleOrderModel.value.order!.userDeliveryAddress!.contact}', style: pw.TextStyle(font: font, fontSize: 10)),
                      pw.Text('Web: www.webmotion.ma', style: pw.TextStyle(font: font, fontSize: 10)),
                    ],
                  ),

                  // Receiver Address (Dynamic)
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(customerName, style: pw.TextStyle(font: font, fontWeight: pw.FontWeight.bold, fontSize: 12)),
                      pw.Text(customerAddress, style: pw.TextStyle(font: font, fontSize: 10)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Designation Table (Dynamic Product Info)
              pw.Table.fromTextArray(
                headers: ['Product Name', 'P.U. HT', 'Qté', 'Total HT'],
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
                cellPadding: pw.EdgeInsets.all(7),

                // Dynamically populate product rows
                data: products.map((product) {
                  return [
                    product.name ?? 'Unknown',
                    product.price ?? 'Unknown',
                    product.quantity.toString(),
                    (double.parse("${product.price}") * double.parse("${product.quantity}")).toString(),
                  ];
                }).toList(),
              ),
              pw.SizedBox(height: 20),

              // Payment Summary (Dynamic)
              _buildSummaryRow('Total HT', singleOrderModel.value.order!.subTotal.toString() ?? '0.00', font),
              _buildSummaryRow('Total TVA 20%', singleOrderModel.value.order!.taxAmount!.toString() ?? '0.00', font),
              _buildSummaryRow('Total TTC', singleOrderModel.value.order!.total!.toString() ?? '0.00', font),
              _buildSummaryRow('Payé', singleOrderModel.value.order!.total!.toString() ?? '0.00', font, isBold: true),
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
      ),
    );
  }
}
