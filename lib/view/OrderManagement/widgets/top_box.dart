import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../comman/widgets.dart';
import '../controller/order.management.controller.dart';

class OrdersBox extends StatelessWidget {
   OrdersBox({
    super.key,
    required this.width,
  });

  final double width;

  //order controller init
  OrderManagementController controller =  Get.find<OrderManagementController>();

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (width > 1200)
            ? 4
            : (width > 900)
            ? 2
            : 1,
        crossAxisSpacing: 20,
        childAspectRatio: 18 / 8,
        mainAxisExtent: 130,
        mainAxisSpacing: (width > 1200)
            ? 0
            : (width > 900)
            ? 20
            : 20,
      ),
      children: [
        Obx(() {
            return wallets(
              width: width,
              text: "Total Orders",
              subTitle: "Total orders in system",
              amounts: "${controller.totalOrder.length}",
              profiteimage: "",
              data: [
                0.0,
                1.0,
                -1.0,
                1.0,
                0.0,
                1.0,
                1.5,
                2.0,
                0.0,
                0.0,
                -0.5,
                -1.0,
                -0.5,
                0.0,
                0.0
              ],
            );
          }
        ),
        Obx(() {
            return wallets(
              width: width,
              text: "Reçue en Attente",
              subTitle: "Total Reçue en Attente orders",
              amounts: "${controller.totalPendingOrder.length}",
              profiteimage: "",
              data: [
                0.0,
                0.0,
                -0.5,
                -1.0,
                -0.5,
                0.0,
                0.0,
                1.0,
                -1.0,
                1.0,
                0.0,
                1.0,
                1.5,
                2.0,
              ],
            );
          }
        ),
        Obx(() {
            return wallets(
              width: width,
              text: "Livré Orders",
              subTitle: "Total Livré orders",
              amounts: "${controller.totalTerminOrders.length}",
              profiteimage: "",
              data: [
                -0.5,
                -1.0,
                -0.5,
                0.0,
                0.0,
                1.0,
                1.5,
                2.0,
                0.0,
                1.0,
                -1.0,
                1.0,
                0.0,
                0.0,
                0.0
              ],
            );
          }
        ),
        Obx(() {
            return wallets(
              width: width,
              text: "Terminé Orders",
              subTitle: "Total Annulé orders",
              amounts: "${controller.totalCompleteOrder.length}",
              profiteimage: "assets/image/orders.png",
              data: [
                1.0,
                -0.5,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                -1.0,
                1.0,
                -0.5,
                -1.0,
                1.5,
                2.0,
                0.0,
                0.0
              ],
            );
          }
        ),
      ],
    );
  }
}
