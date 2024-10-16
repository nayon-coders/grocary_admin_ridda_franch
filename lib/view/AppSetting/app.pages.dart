import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/app_button.dart';
import 'package:minia_web_project/view/AppSetting/controller/setting_controller.dart';

class SettingPages extends StatefulWidget {
  const SettingPages({super.key});

  @override
  State<SettingPages> createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  SettingControleler _settingControleler = Get.put(SettingControleler());
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
          AppInput(hint: "Terms & Condition", controller: _settingControleler.terms.value,maxLine: 6,),
          const SizedBox(height:20),
          const Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
          const SizedBox(height: 20,),
          AppInput(hint: "Privacy Policy", controller: _settingControleler.privacy.value,maxLine: 6,),
          const SizedBox(height:20),
          const Text("About us",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
          const SizedBox(height: 20,),
          AppInput(hint: "About us", controller:_settingControleler.aboutUs.value,maxLine: 6,),
          const SizedBox(height:20),
          const Text("legal",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
          const SizedBox(height: 20,),
          AppInput(hint: "Legal", controller:_settingControleler.legal.value,maxLine: 6,),
          const SizedBox(height:20),
          Obx(() {
              return AppButton(
                  isLoading: _settingControleler.isGettingPrivacy.value,
                  onClick: (){
                    _settingControleler.updatePrivacy();

              }, text: "Update");
            }
          ),

          const SizedBox(height: 30,),




        ],
      ),
    );
  }
}
