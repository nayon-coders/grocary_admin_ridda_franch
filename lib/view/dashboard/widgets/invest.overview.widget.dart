import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../comman/chats/radial_chart.dart';
import '../../../comman/colors.dart';
import '../../OrderManagement/controller/order.management.controller.dart';
import '../screen/dashboard.dart';


class InvestedOverview extends StatefulWidget {
  const InvestedOverview({
    super.key,
  });

  @override
  State<InvestedOverview> createState() => _InvestedOverviewState();
}

class _InvestedOverviewState extends State<InvestedOverview> {


  final controller = Get.find<OrderManagementController>();

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.boxborder, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: width < 336
          ? 550
          : width < 601
          ? 480
          : width < 1275
          ? 350
          : 307,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0),
            child: Text(
              "Order Overview",
              style: TextStyle(
                overflow: TextOverflow.clip,
                fontSize: 15.44,
                fontWeight: FontWeight.w600,
                color: AppColor.dark,
              ),
            ),
          ),
          Container(height: 30),
          width > 600
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // color: Colors.amber,
                height: width < 1201
                    ? 250
                    : width < 1470
                    ? 150
                    : width < 1485
                    ? 200
                    : 180,
                width: width < 1201
                    ? 250
                    : width < 1470
                    ? 150
                    : width < 1485
                    ? 200
                    : 180,
                child: RadialChart(),
              ),
              Container(
                width: width < 1340
                    ? 180
                    : width < 1554
                    ? 200
                    : 250,
                child: InvestedAmount(),
              ),
            ],
          )
              : Column(
            children: [
              Container(
                height: 172,
                width: 172,
                child: RadialChart(),
              ),
              // Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0),
                        child: InvestedAmount(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class InvestedAmount extends GetView<OrderManagementController> {
  const InvestedAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Complete Order",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.lightdark,
              ),
            ),
            Container(height: 5),
            Text(
              "${controller.totalCompleteOrder.length}",
              style: TextStyle(
                fontSize: 21,
                color: AppColor.dark,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(height: 27),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pending Orders",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColor.lightdark,
                      ),
                    ),
                    Container(height: 9),
                    Text(
                      "${controller.totalPendingOrder.length}",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.dark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cancel Order",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColor.lightdark,
                      ),
                    ),
                    Container(height: 9),
                    Text(
                      "${controller.totalCancelOrder.length}",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.dark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      }
    );
  }
}

