import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:minia_web_project/controller/image.picker.controller.dart';
import 'package:minia_web_project/data/model/main.category.model.dart';

import '../../../comman/app.input.dart';
import '../../../comman/app_button.dart';
import '../../../comman/dropdown2.dart';
import '../../../controller/firebase.image.controller.dart';
import '../controller/category.controller.dart';

class AddSubCategoryView extends GetView<CategoryController> {

  ImagePickerController _imagePickerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 350,
      height: 400,
      margin:const EdgeInsets.only(bottom: 20),
      padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Add New Sub Category",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black ),),
          const SizedBox(height: 20,),

          //select image
          Obx(() {
              return InkWell(
                onTap: ()async{
                  await FirebaseImageController.startWebFilePicker(controller.subCategoryCallBack);
                },
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child:  Center(
                    child: controller.subCatImage.value != null ? Image.memory(controller.subCatImage.value!) :  Icon(Icons.upload_outlined, color: Colors.grey, size: 60,),
                  ),
                ),
              );
            }
          ),
          const SizedBox(height: 20,),

          //Sub category name
          AppInput(
            controller: controller.subCategoryName.value,
            hint: "SubCategory Name",
          ),
          const SizedBox(height: 20,),

          //category name
          Obx(() {
              return DropdownButtonHideUnderline(
                child: DropdownButton2<SingleCategory>(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: controller.mainCategoryModel.value.data!.map((item) {
                    return DropdownMenuItem<SingleCategory>(
                      value: item,
                      child: Text(
                        item.name!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                  value: controller.singleMainCategory.value,
                  onChanged: (value) {
                    // Check if the value is not null before assigning
                    if (value != null) {
                      controller.singleMainCategory.value = value;
                      controller.mainCatId.value = value!.id.toString();
                    }
                  },
                  buttonStyleData:  ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300)
                    )
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              );
            }
          ),

          const SizedBox(height: 20,),
          Obx(() {
              return AppButton(
                isLoading: controller.isAddingSubCat.value,
                  onClick: ()async{
                  await controller.addSubCategory(controller.subCatImage.value);
                  },
                  text: "Add"
              );
            }
          ),

        ],
      ),
    );
  }
}
