import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/app_button.dart';
import 'package:minia_web_project/comman/colors.dart';
import 'package:minia_web_project/main.dart';
import 'package:minia_web_project/view/AppSetting/controller/setting_controller.dart';
import 'package:minia_web_project/view/Authentication/pages/login.dart';



class SiteSetting extends StatefulWidget {
  const SiteSetting({super.key});

  @override
  State<SiteSetting> createState() => _SiteSettingState();
}

class _SiteSettingState extends State<SiteSetting> {
  final _newPassword = TextEditingController();
  final _confPassword = TextEditingController();

  SettingControleler? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Get.isRegistered<SettingControleler>()) {
      // If the controller is already registered, find it.
       controller = Get.find<SettingControleler>();
      // Now you can use the controller
    } else {
      // If the controller is not registered, register it.
       controller = Get.put(SettingControleler());
      // Now you can use the controller
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

         //  ///upload logo image
         //  Row(
         //    children: [
         //      Container(
         //        height: 190,
         //        width: 180,
         //        padding:const EdgeInsets.all(10),
         //        decoration: BoxDecoration(
         //          border: Border.all(color: AppColor.borders),
         //          color: Colors.white,
         //          borderRadius: BorderRadius.circular(10),
         //        ),
         //        child: Column(
         //          children: [
         //            const Text("Upload your Logo",
         //              style: TextStyle(
         //                  fontWeight: FontWeight.w500,
         //                  fontSize: 15,
         //                  color: Colors.black),
         //            ),
         //            const SizedBox(height: 5,),
         //
         //            InkWell(
         //              onTap: (){
         //
         //              },
         //              child: Container(
         //                padding:const EdgeInsets.all(10),
         //                decoration: BoxDecoration(
         //                  color: Colors.grey.shade200,
         //                  border: Border.all(color: AppColor.borders),
         //                  borderRadius: BorderRadius.circular(10),
         //                ),
         //                child: const Center(child: Icon(Icons.upload_outlined,color: Colors.grey,size: 70,),),
         //              ),
         //            ),
         //            const SizedBox(height: 10,),
         //            AppButton(onClick: (){}, text:"Upload",),
         //
         //          ],
         //        ),
         //
         //      ),
         //
         //     const SizedBox(width: 20,),
         //
         //      Container(
         //        height: 190,
         //        width: 250,
         //        decoration: BoxDecoration(
         //          borderRadius: BorderRadius.circular(10),
         //          border: Border.all(color: AppColor.borders),
         //          color: Colors.white,
         //        ),
         //        child: const Center(child: Text("Upload Logo",),),
         //      ),
         //    ],
         //  ),
         //
         // const  SizedBox(height: 20,),
         //
         //  const Text("App Banner",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
         //  const SizedBox(height: 20,),
         //  Row(
         //    children: [
         //      Container(
         //          padding:const EdgeInsets.all(10),
         //          height: 250,
         //          width: 220,
         //          decoration: BoxDecoration(
         //            border: Border.all(color: AppColor.borders),
         //            borderRadius: BorderRadius.circular(10),
         //            color: Colors.white,
         //          ),
         //          child: Column(
         //            children: [
         //              const Text("Upload Your Banner",
         //                style: TextStyle(
         //                    fontWeight: FontWeight.w500,
         //                    fontSize: 15,
         //                    color: Colors.black),
         //              ),
         //              const SizedBox(height: 5,),
         //              InkWell(
         //              onTap: (){},
         //                child: Container(
         //                  padding:const EdgeInsets.all(10),
         //                  decoration: BoxDecoration(
         //                    color: Colors.grey.shade200,
         //                    border: Border.all(color: AppColor.borders),
         //                    borderRadius: BorderRadius.circular(10),
         //                  ),
         //                  child: const Center(child: Icon(Icons.upload_outlined,color: Colors.grey,size: 80,),),
         //                ),
         //              ),
         //
         //
         //              const SizedBox(height: 10,),
         //              InkWell(
         //                onTap: (){
         //                  selectCategoryMethod();
         //                },
         //                child: Container(
         //                  height: 35,
         //                  padding: const EdgeInsets.all(5),
         //                  decoration: BoxDecoration(
         //                    borderRadius: BorderRadius.circular(10),
         //                    border: Border.all(color: AppColor.borders),
         //                    color: Colors.white,
         //                  ),
         //                  child:const Row(
         //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
         //                    children: [
         //                      Text("Select Category",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),),
         //                      Icon(Icons.arrow_drop_down,color: Colors.grey,)
         //                    ],
         //                  ),
         //                ),
         //              ),
         //
         //              const SizedBox(height: 10,),
         //              AppButton(onClick: (){}, text:"Upload",),
         //
         //            ],
         //          )
         //      ),
         //
         //      const SizedBox(width: 20,),
         //
         //
         //      //show banner
         //      Expanded(
         //        child: Container(
         //          height: 250,
         //          decoration: BoxDecoration(
         //            border: Border.all(color: AppColor.borders),
         //            borderRadius: BorderRadius.circular(10),
         //            color: Colors.white,
         //          ),
         //          child:const Center(child: Text("Upload Banner",),),
         //        ),
         //      ),
         //
         //    ],
         //  ),
         //
         //
         //  change password
          const SizedBox(height: 40,),
          const Text("Change Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
          const SizedBox(height: 10,),
          AppInput(hint: "Old password", controller: controller!.oldPass.value),
          const SizedBox(height: 20,),
          AppInput(hint:"New Password", controller: controller!.newPass.value),
          const SizedBox(height: 20,),
          AppInput(hint:"Re-type Password", controller: _confPassword),
          const SizedBox(height: 30,),
          Row(
            children: [
              Obx(() {
                  return AppButton(
                    isLoading: controller!.isUpdatePass.value,
                    onClick: (){
                      if(controller!.newPass.value.text != _confPassword.text){
                        Get.snackbar("Error", "Password not match",snackPosition: SnackPosition.TOP,backgroundColor: Colors.red);
                        return;
                      }
                      controller!.changeAdminPassword();
                    }, text: "Update",);
                }
              ),
             const SizedBox(width: 30,),
              AppButton(onClick: (){
                sharedPreferences!.clear();
                Get.offAll(Login());
              }, text: "Logout",bgColor: Colors.red,),
            ],
          )

        ],
      ),
    );
  }


  ///select category dialog
  
   selectCategoryMethod(){
    return showDialog(
      barrierDismissible: true,

        context: context, builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.zero,
        title: const Text("Select Category",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
        content: Container(

          height:500,
          width: 300,
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context,index){
            return  Container(
              margin:const  EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: ListTile(
                onTap: (){},
                contentPadding: const EdgeInsets.only(left: 10),
                title: Text("Category"),
                leading:Icon(Icons.ac_unit_sharp),
              ),
            );
          }),
        ),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context), child:const Text("Cancel"))
        ],

      );
    });
   }
}
