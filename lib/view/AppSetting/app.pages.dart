import 'package:flutter/material.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/app_button.dart';

class SettingPages extends StatefulWidget {
  const SettingPages({super.key});

  @override
  State<SettingPages> createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  final _termsandcondition = TextEditingController();
  final _aboutus = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(

      padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.grey.shade50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Terms & Condition",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
          const SizedBox(height: 20,),
          AppInput(hint: "Terms & Condition", controller: _termsandcondition,maxLine: 6,),
          const SizedBox(height:20),
          AppButton(onClick: (){}, text: "Update"),

          const SizedBox(height: 30,),
          const Text("About us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
          const SizedBox(height: 20,),
          AppInput(hint: "About us", controller: _aboutus,maxLine: 6,),
          const SizedBox(height:20),
          AppButton(onClick: (){}, text: "Update"),

          const SizedBox(height: 30,),




        ],
      ),
    );
  }
}
