import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/view/OrderManagement/controller/order.management.controller.dart';
import 'package:minia_web_project/view/user_management/controller/user.controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../comman/colors.dart';
import '../screen/dashboard.dart';


class WalletBalance extends StatefulWidget {
  const WalletBalance({
    super.key,
  });

  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {




  late List<ChartData> _chartData;
  late List<ChartData> _loadingChartData;
  late TooltipBehavior _tooltipBehavior;
  int selectedOption = -1;

  final controller = Get.find<OrderManagementController>();
  @override
  initState() {

    _loadingChartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.boxborder, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: width < 325
          ? 580
          : width < 601
          ? 520
          : width < 1275
          ? 350
          : 307,
      child: Obx((){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 20.0,
                    left: 16.0,
                    right: 15,
                    bottom: width < 1470 ? 20.0 : 0),
                child: Text(
                  "Payment Overview",
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 15.44,
                    fontWeight: FontWeight.w600,
                    color: AppColor.dark,
                  ),
                ),
              ),
              width > 600
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                    ),
                    width: width < 1201
                        ? 250
                        : width < 1470
                        ? 150
                        : width < 1485
                        ? 200
                        : 250,
                    height: width < 1201
                        ? 250
                        : width < 1470
                        ? 150
                        : width < 1485
                        ? 200
                        : 250,
                    // width: 200,
                    child: SfCircularChart(
                      borderWidth: 0,
                      enableMultiSelection: true,
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        PieSeries<ChartData, String>(
                          dataSource:  getChartData(),
                          xValueMapper: (ChartData data, _) => data.text,
                          yValueMapper: (ChartData data, _) => data.textnum,
                          pointColorMapper: (ChartData data, _) => data.color,
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle:
                              TextStyle(color: AppColor.mainbackground)),
                        )
                      ],
                    )
                  ),
                  Container(
                    height: 220,
                    // color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 10),
                        WalletBalanceText(
                          title: "Net Income",
                          textleft: "\$${controller.totalNetIncome.value.toStringAsFixed(2)}",
                          textright: "",
                          dotcolor: AppColor.background,
                        ),
                        WalletBalanceText(
                          title: "Upcoming Payment",
                          textleft: "\$${controller.upcommingIncom.value.toStringAsFixed(2)}",
                          textright: "",
                          dotcolor: AppColor.selecteColor,
                        ),
                        WalletBalanceText(
                          title: "Cancel Paymen",
                          textleft: "\$${controller.cancelIncom.value.toStringAsFixed(2)}",
                          textright: "",
                          dotcolor: AppColor.darkblue,
                        )
                      ],
                    ),
                  ),
                ],
              )
                  : Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 209,
                      width: 227,
                      child:  SfCircularChart(
                        enableMultiSelection: true,
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          PieSeries<ChartData, String>(
                            dataSource: getChartData() ,
                            xValueMapper: (ChartData data, _) => data.text,
                            yValueMapper: (ChartData data, _) => data.textnum,
                            pointColorMapper: (ChartData data, _) => data.color,
                            dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                textStyle:
                                TextStyle(color: AppColor.mainbackground)),
                          )
                        ],
                      )

                  ),
                  Container(height: 30),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WalletBalanceText(
                          title: "Bitcoin",
                          textleft: "0.4412 BTC",
                          textright: " = \$ 4025.32",
                          dotcolor: AppColor.background,
                        ),
                        WalletBalanceText(
                          title: "Ethereum",
                          textleft: "4.5701 ETH",
                          textright: " = \$ 1123.64",
                          dotcolor: AppColor.selecteColor,
                        ),
                        WalletBalanceText(
                          title: "Litecoin",
                          textleft: "35.3811 LTC",
                          textright: " = \$ 2263.09",
                          dotcolor: AppColor.darkblue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }

  Widget buildOptionButton(int option, String label, Color color) {
    const selectedColor = Colors.red;
    const unselectedColor = Colors.yellow;
    final buttonColor =
    selectedOption == option ? selectedColor : unselectedColor;
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedOption = option;
          });
        },
        child: Container(
          height: 28,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: buttonColor == selectedColor
                ? color
                : AppColor.lightgrey.withOpacity(.08),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: buttonColor == selectedColor
                      ? AppColor.mainbackground
                      : AppColor.lightgrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}



List<ChartData> getChartData() {
  AppUserController userController = Get.put(AppUserController());

  if(userController.isLoading.value){
    final List<ChartData> chartData = [
      ChartData("Verify User",0, Color(0xFFA8AADA)),
      ChartData("Unverified User", 0, Color(0xFF777ACA)),
      ChartData("Active User", 0, Color(0xFF5156BE)),
    ];
    return chartData;
  }else{
    final List<ChartData> chartData = [
      ChartData("Net Income", 3849.90, Color(0xFFA8AADA)),
      ChartData("Upcoming Payment", 1009, Color(0xFF777ACA)),
      ChartData("Cancel Payment", 898.80, Color(0xFF5156BE)),
    ];
    return chartData;
  }

}



List<ChartData> getLoadingChartData() {
  AppUserController userController = Get.find<AppUserController>();

  final List<ChartData> chartData = [
    ChartData("Verify User",0, Color(0xFFA8AADA)),
    ChartData("Unverified User", 0, Color(0xFF777ACA)),
    ChartData("Active User", 0, Color(0xFF5156BE)),
  ];
  return chartData;
}


class ChartData {
  ChartData(this.text, this.textnum, this.color);
  final String text;
  final dynamic textnum;
  final Color color;
}



class WalletBalanceText extends StatelessWidget {
  final String title;
  final String textleft;
  final String textright;
  final Color dotcolor;

  const WalletBalanceText({
    super.key,
    required this.title,
    required this.textleft,
    required this.textright,
    required this.dotcolor,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Container(
      height: 60,
      // color: AppColor.darkGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: dotcolor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Container(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.w400,
                  color: AppColor.dark,
                ),
              )
            ],
          ),
          Container(height: 9),
          Row(
            children: [
              Text(
                textleft,
                style: TextStyle(
                  fontSize: 14,
                  height: .18,
                  color: AppColor.dark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                textright,
                style: TextStyle(
                  fontSize: 14,
                  height: .18,
                  color: AppColor.lightgrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Container(height: 20),
        ],
      ),
    );
  }
}
