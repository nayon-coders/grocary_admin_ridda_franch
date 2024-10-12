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

  // Generate Invoice Method
  Future<void> generateInvoice() async {
    // Load the image asynchronously before creating the PDF
    final Uint8List logoImage = await _getImageFromAsset('assets/image/logo.png');

    // Create a PDF document
    final pdf = pw.Document();

// Initialize product list
    List<List<String>> product = [];

    // Add product list
    for (var i in singleOrderModel.value!.order!.products!) {
        double unitPrice = i.price ?? 0.0; // Default to 0.0 if price is null
        int quantity = i.quantity ?? 0; // Default to 0 if quantity is null
        double totalPrice = unitPrice * quantity; // Calculate total price

        // Add the product details in the required format
        product.add([
          i.name ?? 'Unnamed Product', // Fallback for name if null
          quantity.toString(), // Quantity as a string
          '${unitPrice.toStringAsFixed(2)}', // Unit price formatted as string with Euro symbol
          '${totalPrice.toStringAsFixed(2)}', // Total price formatted as string with Euro symbol
        ]);
    }


    print("this is product ------ ${product}");
    // Add a page
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Invoice title
            pw.Text(
              'Invoice',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 20),

            // Logo
            pw.Center(
              child: pw.Image(
                pw.MemoryImage(logoImage), // Pass the image you loaded
                height: 100,
                width: 100,
              ),
            ),
            pw.SizedBox(height: 20),

            // Order Information
            pw.Text('Order Id: ${singleOrderModel.value!.order!.id.toString()}'),
            pw.Text('Delivery Date: ${singleOrderModel.value!.order!.deliveryDate!.toString()}'),
            pw.SizedBox(height: 20),

            // Table with Order Items
            pw.Text('Order Items', style: pw.TextStyle(fontSize: 18)),
            pw.Table.fromTextArray(
              headers: ['Item', 'Quantity', 'Unit Price', 'Total Price'],
              data: product,
            ),
            pw.SizedBox(height: 20),

            // Order Summary
            pw.Text('Order Summary', style: pw.TextStyle(fontSize: 18)),
            pw.Divider(),
            _buildSummaryRow('Subtotal', '${singleOrderModel.value!.order!.subTotal!.toStringAsFixed(2)}'),
            _buildSummaryRow('Tax', '(+) ${singleOrderModel.value.order!.taxAmount!.toStringAsFixed(2)}'),
            _buildSummaryRow('Delivery Fee', '(+) ${singleOrderModel.value!.order!.deliveryFee!.toStringAsFixed(2)}'),
            _buildSummaryRow('Total', '${singleOrderModel.value.order!.total!.toStringAsFixed(2)}'),
            _buildSummaryRow('Paid by customer', '${singleOrderModel.value.order!.total!.toStringAsFixed(2)}', isBold: true),

            pw.SizedBox(height: 40),
            pw.Center(child: pw.Text('All Copy right @Commandespros.com 2024', style: pw.TextStyle(fontSize: 12,)), )

          ],
        ),
      ),
    );

    // Save the PDF and initiate download in web
    final Uint8List pdfData = await pdf.save();
    final blob = html.Blob([pdfData], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'invoice.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  // Helper method to fetch the image
  Future<Uint8List> _getImageFromAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    return data.buffer.asUint8List();
  }

  // Helper method to build summary rows
  pw.Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontSize: 14,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
