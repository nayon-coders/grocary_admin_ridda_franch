import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/view/OrderManagement/controller/order.management.controller.dart';

import '../../../comman/widgets.dart';


class Wallet extends GetView<OrderManagementController> {
  const Wallet({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
            wallets(
              width: width,
              text: "Net Income",
              subTitle: "Total Net Income",
              amounts: "\$${controller.totalNetIncome.value.toStringAsFixed(2)}",
              profiteimage: "assets/image/income.png",
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
            ),
            wallets(
              width: width,
              text: "Upcoming Income",
              subTitle: "Total Upcoming Income",
              amounts: "\$${controller.upcommingIncom.value.toStringAsFixed(2)}",
              profiteimage: "assets/image/income.png",
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
            ),
            wallets(
              width: width,
              text: "Pending Payment",
              subTitle: "Total Pending Payment",
              amounts: "\$${controller.pendingIncom.value.toStringAsFixed(2)}",
              profiteimage: "assets/image/income.png",
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
            ),
            wallets(
              width: width,
              text: "Cancel Payment",
              subTitle: "Total Cancel Payment",
              amounts: "\$${controller.cancelIncom.value.toStringAsFixed(2)}",
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
            ),
          ],
        );
      }
    );
  }
}
