import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/view/AdminManagement/controller/admin.role.controller.dart';
import 'package:minia_web_project/view/AdminManagement/widgets/admin.role.list.view.dart';

import '../../../comman/app.input.dart';
import '../../../comman/app_button.dart';
import '../../../comman/dropdown2.dart';

class AddNewAdmin extends StatefulWidget {
  const AddNewAdmin({super.key});

  @override
  State<AddNewAdmin> createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {

  //inject the controller
  AdminRoleController _adminRoleController = Get.find<AdminRoleController>();
  //inject the controller


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _adminRoleController.getAllRoleList(); //getting all role list
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.centerLeft,
      padding:const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Add Admin",
              style: TextStyle(fontSize:20,fontWeight: FontWeight.w700,color: Colors.black ),),
            const SizedBox(height: 30,),

            Container(
              padding:const EdgeInsets.all(15),
              width: MediaQuery.sizeOf(context).width*.60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                //color: Colors.grey.shade100,

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //first name
                  const Text("First Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "First Name", controller: _adminRoleController.firstName.value),
                  const SizedBox(height: 15,),

                  //last name
                  const Text("Last Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "Last Name", controller: _adminRoleController.lastName.value),
                  const SizedBox(height: 15,),

                  //email
                  const Text("Email ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "Email", controller: _adminRoleController.email.value),
                  const SizedBox(height: 15,),

                  //password
                  const Text("Password",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "Password", controller: _adminRoleController.pass.value),
                  const SizedBox(height: 15,),


                  //user role dropdown
                  const Text("Select  Role",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  AdminRoleList(),
                  SizedBox(height: 20,),

                  const SizedBox(height: 40,),


                  AppButton(
                    width: size.width,
                    text:"Submit",
                    isLoading: _adminRoleController.isCreatingAdmin.value,
                    onClick:()async{
                      await _adminRoleController.createNewAdmin();
                    },
                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
