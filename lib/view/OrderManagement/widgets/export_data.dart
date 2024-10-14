// import 'dart:html' as html;
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
//
// import '../../../comman/app_button.dart';
//
//
//
// class ExportDataPopUp extends StatefulWidget {
//   const ExportDataPopUp({super.key});
//
//   @override
//   State<ExportDataPopUp> createState() => _ExportDataPopUpState();
// }
//
// class _ExportDataPopUpState extends State<ExportDataPopUp> {
//   final Workbook workbook = new Workbook();
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Export orders'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(bottom: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//               ),
//               child: ListTile(
//                 title: Text("Export: Last 24 hours orders"),
//                 trailing: AppButton(
//                   text: "Export",
//                   onClick: ()async{
//                     var today = DateFormat("yyyy-dd-MM").format(DateTime.now());
//                     // var allData =  await OrderController.allOrderData();
//                     // for(var i =0; i< allData.docs.length; i++){
//                     //   var orderModel = OrderModel.fromJson(allData[i]);
//                     //   if(orderModel.createAt.toString().contains(today)){
//                     //
//                     //   }
//                     // }
//                     await last24HoursOrders(today);
//                   },
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade200,
//               ),
//               child: ListTile(
//                 title: Text("Export: All Order's"),
//                 trailing: AppButton(
//                   text: "Export",
//                   onClick: ()async{
//                     await allOrderReport();
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           child: Text('Close'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
//
//
//   Future<List<Product>> last24HoursOrders(today) async {
//     List<Product> product = [];
//     var querySnapshot = await FirebaseFirestore.instance.collection(orderCollection).get();
//
//     for(var i =0; i< querySnapshot.docs.length; i++){
//       var orderModel = OrderModel.fromJson(querySnapshot.docs[i]);
//       if(orderModel.createAt.toString().contains(today)){
//         for(var j=0; j< orderModel.products!.length; j++){
//           product.add(orderModel.products![j]);
//         }
//       }
//
//     }
//
//     exportDataToExcel(product, "lat24hours");
//
//     return product;
//   }
//
//   Future<List<Product>> allOrderReport() async {
//     List<Product> product = [];
//     var querySnapshot = await FirebaseFirestore.instance.collection(orderCollection).get();
//
//     for(var i =0; i< querySnapshot.docs.length; i++){
//       var orderModel = OrderModel.fromJson(querySnapshot.docs[i]);
//       for(var j=0; j< orderModel.products!.length; j++){
//         product.add(orderModel.products![j]);
//       }
//
//     }
//
//     exportDataToExcel(product, "all_orders_report");
//
//     return product;
//   }
//
//
//   Future<void> exportDataToExcel(List<Product> product, filename) async {
//     try {
//
//
//       // Create Excel workbook and worksheet
//       final Workbook workbook = Workbook();
//       final Worksheet sheet = workbook.worksheets[0];
//
//       // Adding header row
//       sheet.getRangeByName('A1').setText('Product Name');
//       sheet.getRangeByName('B1').setText('Product Price (For this user)');
//       sheet.getRangeByName('C1').setText('Total order');
//       sheet.getRangeByName('D1').setText('Total Item Price');
//
//       // Adding data rows
//       for (int i = 0; i < product.length; i++) {
//         sheet.getRangeByIndex(i + 2, 1).setText(product[i].productInfo!.name);
//         sheet.getRangeByIndex(i + 2, 2).setText(product[i].itemPrice!);
//         sheet.getRangeByIndex(i + 2, 3).setText("${product[i].qty!} ${product[i].productInfo!.productType!}");
//         sheet.getRangeByIndex(i + 2, 4).setNumber(double.parse("${product[i].qty!}") * double.parse("${product[i].itemPrice}"));
//
//       }
//
//       // Calculate total item price
//       double totalItemPrice = product.fold<double>(0, (sum, product) {
//         return sum + (double.parse(product.qty!) * double.parse(product.itemPrice!));
//       });
//
//       // Add total row
//       int lastRowIndex = product.length + 2; // Adjust for header and 1-based index
//       sheet.getRangeByIndex(lastRowIndex, 1).setText('Total');
//       sheet.getRangeByIndex(lastRowIndex, 4).setNumber(totalItemPrice);
//
//       // Save workbook as bytes
//       final List<int> bytes = workbook.saveAsStream();
//       workbook.dispose();
//
//       // Convert bytes to Uint8List
//       final Uint8List uint8list = Uint8List.fromList(bytes);
//
//       // Create a Blob object from Uint8List
//       final html.Blob blob = html.Blob([uint8list], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
//
//       // Create download link using AnchorElement
//       final url = html.Url.createObjectUrlFromBlob(blob);
//       html.AnchorElement(href: url)
//         ..setAttribute('download', '$filename.xlsx')
//         ..click();
//
//       // Release the allocated resources
//       html.Url.revokeObjectUrl(url);
//
//       Navigator.pop(context);
//
//       print("......... erport complete...........");
//     } catch (e) {
//       print('Error exporting to Excel: $e');
//     }
//
//
//
//   }
//
//
//   Future<String> getTemporaryPath() async {
//     final directory = await getTemporaryDirectory();
//     return directory.path;
//   }
//
// }