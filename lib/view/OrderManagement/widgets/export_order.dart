import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:minia_web_project/view/OrderManagement/controller/export_controller.dart';

import '../controller/order.management.controller.dart';

class ExportOrders extends StatefulWidget {
  final Function(bool)? onExport;
  const ExportOrders({super.key, this.onExport});

  @override
  State<ExportOrders> createState() => _ExportOrdersState();
}

class _ExportOrdersState extends State<ExportOrders> {
  var fromDate;
  var toDate;

  //get find ordermanagmenr controller
  final OrderManagementController orderManagementController = Get.find<OrderManagementController>();


  bool isExporting = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: ()=>widget.onExport!(false),
                icon: Icon(Icons.close, color: Colors.black, size: 20,),
              ),
              Text('Close Exporting', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 30,),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Select Date Range', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    title: Text('${fromDate == null ? 'From Date' : DateFormat('EEEE, MMMM d, y').format(fromDate)}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                          fromDate = picked;
                        });
                      }
                    },
                  ),
                  ListTile(
                    title: Text('${toDate == null ? 'To Date' : DateFormat('EEEE, MMMM d, y').format(toDate)}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                           toDate = picked;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 20,),

                  Obx(() {
                      return orderManagementController.exportAllOrderModel.isEmpty
                          ?  Center(
                            child: Text("No Orders Found", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ) :  Center(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text('Total Orders: ${orderManagementController.exportAllOrderModel.length}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text('Total Product: ${orderManagementController.exportTotalProduct.length}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          );
                    }
                  ),
                  SizedBox(height: 10,),
                  Obx(()  {
                    if(orderManagementController.exportAllOrderModel.isNotEmpty){
                      return InkWell(
                        onTap: ()async{
                          setState(() => isExporting = true);
                          await ExportController.exportDataToExcel(orderManagementController.exportTotalProduct.value, "exported_order");
                          setState(() => isExporting = false);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 50, right: 50),
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: isExporting
                                ? CircularProgressIndicator(color: Colors.white,)
                                :  Text("Export Data", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      );
                    }else{
                      return InkWell(
                        onTap: (){
                          if(fromDate == null || toDate == null){
                           Get.snackbar("Error", "Please select both dates", snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
                            return;
                          }
                          orderManagementController.getExportedOrders(DateFormat("yyyy-MM-dd").format(fromDate), DateFormat("yyyy-MM-dd").format(toDate));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 50, right: 50),
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: orderManagementController.isGettingExportedOrder.value
                                ? CircularProgressIndicator(color: Colors.white,)
                                :  Text("Get Product", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      );
                    }


                    }
                  ),



                      ]
            )
                      ),
          )
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class ExportOrderAlert extends StatefulWidget {
//   const ExportOrderAlert({super.key});
//
//   @override
//   State<ExportOrderAlert> createState() => _ExportOrderAlertState();
// }
//
// class _ExportOrderAlertState extends State<ExportOrderAlert> {
//
//   DateTime? fromDate;
//   DateTime? toDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select Date Range'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ListTile(
//             title: Text(
//               fromDate == null
//                   ? 'From Date'
//                   : 'From: ${DateFormat('yyyy-MM-dd').format(fromDate!)}',
//             ),
//             trailing: Icon(Icons.calendar_today),
//             onTap: () async {
//               DateTime? picked = await showDatePicker(
//                 context: context,
//                 initialDate: fromDate ?? DateTime.now(),
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//               );
//               if (picked != null) {
//                 setState(() {
//                   fromDate = picked;
//                 });
//               }
//             },
//           ),
//           ListTile(
//             title: Text(
//               toDate == null
//                   ? 'To Date'
//                   : 'To: ${DateFormat('yyyy-MM-dd').format(toDate!)}',
//             ),
//             trailing: Icon(Icons.calendar_today),
//             onTap: () async {
//               DateTime? picked = await showDatePicker(
//                 context: context,
//                 initialDate: toDate ?? DateTime.now(),
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//               );
//               if (picked != null) {
//                 setState(() {
//                   toDate = picked;
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             if (fromDate != null && toDate != null) {
//           
//               Navigator.of(context).pop(); // Close the dialog
//             } else {
//               // Show an error or prompt the user to select both dates
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Please select both From and To dates.'),
//                 ),
//               );
//             }
//           },
//           child: Text('Export'),
//         ),
//       ],
//     );
//   }
// }
