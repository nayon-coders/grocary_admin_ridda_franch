// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace

// import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/view/OrderManagement/controller/order.management.controller.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../comman/chats/chatdetailpage.dart';
import '../../../comman/chats/radial_chart.dart';
import '../../../comman/colors.dart';
import '../../../comman/common.widgets.dart';
import '../../../comman/widgets.dart';
import '../../Authentication/controller/login.controller.dart';
import '../../Authentication/pages/login.dart';
import '../../Menus/map_model.dart';
import '../widgets/invest.overview.widget.dart';
import '../widgets/w3.news.dart';
import '../widgets/wallet.blance.dart';
import '../widgets/wallet.boxs.widgets.dart';

class Dashboard extends StatelessWidget {
   Dashboard({super.key});

   final OrderManagementController orderManagementController = Get.put(OrderManagementController());


  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   orderManagementController.getAllOrder();
    // });
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          if (width > 600)
            RowTitel(
              textL: "Dashboard",
              texti: "Dashboard",
              textii: "Dashboard",
            )
          else
            ColumnTitel(
              textL: 'Dashboard',
              texti: 'Dashboard',
              textii: 'Dashboard',
            ),
          Container(height: 20),
          SizedBox(
            height: (width > 1200)
                ? 150
                : (width > 900)
                    ? 300
                    : 600,
            child: Wallet(width: width),
          ),
          if (width > 1200) RowChar() else ColumnChart(),


        ],
      ),
    );
  }
}


class RowChar extends StatelessWidget {
  const RowChar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 4, child: WalletBalance()),
        Container(width: 20),
        Expanded(flex: 4, child: InvestedOverview()),
        Container(width: 20),
        //Expanded(flex: 2, child: BitcoinNews()),
      ],
    );
  }
}


String isSelected = "All";
String isSelected2 = "Buy";







class ColumnChart extends StatelessWidget {
  const ColumnChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WalletBalance(),
        Container(height: 15),
        InvestedOverview(),
        Container(height: 15),
        BitcoinNews()
      ],
    );
  }
}


