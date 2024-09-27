
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/comman/app_network_image.dart';
import 'package:minia_web_project/controller/firebase.image.controller.dart';
import 'package:minia_web_project/controller/image.picker.controller.dart';
import 'package:minia_web_project/view/ProductManagement/controller/category.controller.dart';
import 'package:flutter/material.dart';

import '../../../comman/app.input.dart';
import '../../../comman/app_button.dart';
class AdNewMainCategorySection extends GetView<CategoryController> {


  ImagePickerController _imagePickerController = Get.find();

  final _categoryKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 370,
      margin: const EdgeInsets.only(bottom: 20),
      padding:const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300)
      ),
      child: Form(
        key: _categoryKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add New Category",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black ),),
            const SizedBox(height: 20,),

            Obx(() {
                return InkWell(
                  onTap: ()async{
                    await FirebaseImageController.startWebFilePicker(controller.categoryCallBack);
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child:  Center(
                      child:  controller.mainCatImage.value != null
                          ? Image.memory(
                        controller.mainCatImage!.value!,
                        fit: BoxFit.cover,
                      ) : controller.editSingleCategory.value?.image != null
                          ? AppNetworkImage(image: controller.editSingleCategory.value!.image!)
                          : Icon(Icons.upload_outlined, color: Colors.grey, size: 80),
                           
                    ),
                  ),
                );
              }
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: AppInput(
                controller: controller.categoryName.value,
                hint: "Category Name",
              ),
            ),

            Obx(() {
                return AppButton(
                  isLoading: controller.isLoading.value,
                    onClick: ()async{
                  if(_categoryKey.currentState!.validate()){
                    if(controller.editSingleCategory.value?.image != null){
                      await controller.updateCategory();
                    }else{
                      await controller.createCategory();
                    }

                  }
                }, text: "${controller.editSingleCategory.value?.image != null ? "Edit" : "Add"}");
              }
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }


}