import 'package:flutter/material.dart';
import 'package:minia_web_project/comman/colors.dart';


class AppInput extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType?textType;
  final int? maxLine;

  const AppInput({
    super.key,
    required this.hint,
    this.obscure = false,
    required this.controller,
    this.readOnly = false,
    this.validator,
    this.textType,
    this.maxLine ,


  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      obscureText: obscure,
      controller: controller,
      style: const TextStyle(
        fontSize: 14,
        color: AppColor.hintcolor,
        fontWeight: FontWeight.w400,
      ),
      autocorrect: true,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(
            color: AppColor.hintcolor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        // fillColor: AppColor.lightwhite.withOpacity(.25),
        // contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColor.borders,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColor.borders,),
        ),
      ),
    );
  }
}