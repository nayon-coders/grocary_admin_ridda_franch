import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/view/ProductManagement/controller/postcode.controller.dart';

import '../../../comman/app.input.dart';
import '../../../comman/app_button.dart';
import '../../../comman/title_text.dart';

class AddPostCode extends GetView<PostCodeController> {


  @override
  Widget build(BuildContext context) {
    controller.getAllPostCode();
    return Container(

      width: double.infinity,
      margin: EdgeInsets.only(left: 100, right: 100),
      decoration: BoxDecoration(

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(height: 20,),
          const TitleText(text: "Add Post Code"),
          const SizedBox(height: 10,),
          SizedBox(height: 60,
            child: Row(
              children: [
                Expanded(
                    child: AppInput(controller: controller.postCode.value, hint: "Post Code")),
                SizedBox(width: 20,),
                Obx(() {
                    return AppButton(
                        isLoading: controller.isDataAdding.value,
                        onClick: ()async{
                        await controller.addPostCode();
                    }, width: 200, text: "Add Now");
                  }
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Obx(() {
            if(controller.isDataGetting.value){
              return Center(child: CircularProgressIndicator(),);
            }
              return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.postCodeModel.value.data!.length,
                    itemBuilder: (context, index) {
                      var data = controller.postCodeModel.value.data![index];
                      return ListTile(
                        title: Text("${data.code}"),
                        trailing: IconButton(
                          onPressed: ()async{
                            await controller.deletePost(data.id.toString());
                          },
                          icon: controller.isDataDeleting.value ? CircularProgressIndicator() : Icon(Icons.delete, color: Colors.red,),
                        ),
                      );
                    }
                );
            }
          )


        ],
      ),
    );
  }
}
