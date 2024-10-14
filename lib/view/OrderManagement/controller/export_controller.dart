import 'package:get/get.dart';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;

import '../../../data/model/all_order_model.dart';
class ExportController {


  static exportDataToExcel(List<OrderProductItem> product, String filename) async {
    try {
      // Create a modifiable copy of the product list
      List<OrderProductItem> modifiableProductList = List<OrderProductItem>.from(product);

      // Create Excel workbook and worksheet
      final xlsio.Workbook workbook = xlsio.Workbook();
      final xlsio.Worksheet sheet = workbook.worksheets[0];

      // Adding header row
      sheet.getRangeByName('A1').setText('Product Name');
      sheet.getRangeByName('B1').setText('Product Price (For this user)');
      sheet.getRangeByName('C1').setText('Total order');
      sheet.getRangeByName('D1').setText('Total Item Price');

      // Adding data rows
      for (int i = 0; i < modifiableProductList.length; i++) {
        sheet.getRangeByIndex(i + 2, 1).setText(modifiableProductList[i].name);
        sheet.getRangeByIndex(i + 2, 2).setText(modifiableProductList[i].price!.toStringAsFixed(2));
        sheet.getRangeByIndex(i + 2, 3).setText("${modifiableProductList[i].quantity!}");
        sheet.getRangeByIndex(i + 2, 4).setNumber(
            double.parse(modifiableProductList[i].quantity!.toStringAsFixed(2)) *
                double.parse(modifiableProductList[i].price!.toStringAsFixed(2)));
      }

      // Calculate total item price
      double totalItemPrice = modifiableProductList.fold<double>(0, (sum, product) {
        return sum + (double.parse(product.quantity!.toStringAsFixed(2)) *
            double.parse(product.price!.toStringAsFixed(2)));
      });

      // Add total row
      int lastRowIndex = modifiableProductList.length + 2;
      sheet.getRangeByIndex(lastRowIndex, 1).setText('Total');
      sheet.getRangeByIndex(lastRowIndex, 4).setNumber(totalItemPrice);

      // Save workbook as bytes
      final List<int> bytes = workbook.saveAsStream();
      // No workbook.dispose(); to avoid the error

      // Convert bytes to Uint8List
      final Uint8List uint8list = Uint8List.fromList(bytes);

      // Create a Blob object from Uint8List
      final html.Blob blob = html.Blob([uint8list], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

      // Create download link using AnchorElement
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute('download', '$filename.xlsx')
        ..click();

      // Release the allocated resources
      html.Url.revokeObjectUrl(url);

      print("......... export complete...........");
    } catch (e, stacktrace) {
      print('Error exporting to Excel: $e');
      print(stacktrace);
    }
  }

  Future<String> getTemporaryPath() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }


}