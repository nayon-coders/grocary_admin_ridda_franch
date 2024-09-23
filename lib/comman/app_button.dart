import 'package:flutter/material.dart';

import 'colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
        required this.onClick,
        required this.text,
        this.isLoading = false,
        this.width = 200,
        this.bgColor = AppColor.darkGreen});
  final VoidCallback onClick;
  final String text;
  final bool isLoading;
  final double width;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        height: 38,
        padding:const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLoading
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
              : Text(
            "${text}",
            style:const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
