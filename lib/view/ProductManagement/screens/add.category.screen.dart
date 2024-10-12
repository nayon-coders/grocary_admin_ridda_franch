
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/comman/app_button.dart';
import 'package:minia_web_project/comman/title_text.dart';
import 'package:minia_web_project/view/ProductManagement/controller/category.controller.dart';
import 'package:minia_web_project/view/ProductManagement/widgets/add.sub.category.view.dart';

import '../../../comman/app.input.dart';
import '../../../comman/colors.dart';
import '../widgets/addnew.category.section.dart';
import '../widgets/category.list.view.dart';

class AddNewCategory extends StatelessWidget {

  CategoryController controller = Get.put(CategoryController());


  @override
  Widget build(BuildContext context) {
    controller.getMainCategory();
    Size size = MediaQuery.sizeOf(context);
    return Container(

      width: size.width,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(text:"Category Management"),
           const SizedBox(height: 20,),

            SizedBox(
              height: size.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  ///left Side

                  SizedBox(
                    width: 350,
                    height: size.height,
                    child: ListView(
                      children: [
                        //
                        //Add new category section
                        AdNewMainCategorySection(), //add new category section
                        //Add new category section
                       const SizedBox(height: 10,),

                        //add sub category
                        AddSubCategoryView(),





                      ],
                    ),
                  ),

                  const SizedBox(width: 20,),

                  ///Right Side
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: CategoryListView(),

                  ))



                ],

              ),

            ),


          ],
        ),
      ),
    );
  }
}

