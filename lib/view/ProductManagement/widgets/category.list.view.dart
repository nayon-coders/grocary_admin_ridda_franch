import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/comman/app_network_image.dart';

import '../../../comman/colors.dart';
import '../controller/category.controller.dart';

class CategoryListView extends GetView<CategoryController> {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text("All Category",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )),
        SizedBox(
          child: Obx(() {
            if (controller.isDataGetting.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.mainCategoryModel.value.data!.length,
                  itemBuilder: (context, index) {
                    var data = controller.mainCategoryModel.value.data![index];

                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.borders)
                          //color: Colors.grey.shade100,
                          ),
                      child: Column(
                        children: [
                          ///category name
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    data.image!.isNotEmpty
                                        ? AppNetworkImage(image: data.image!)
                                        : Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${data.name!}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 110,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: (){
                                            controller.editSingleCategory.value = data!;
                                            controller.categoryName.value.text = data.name!;
                                            controller.selectedId.value = data.id.toString();
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.amber,
                                            size: 20,
                                          )),
                                      Obx(() {
                                          return IconButton(
                                              onPressed: () async {
                                                Get.defaultDialog(
                                                    title: "Are You sure?",
                                                    content: Container(
                                                      width: 400,
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: const Text(
                                                          "Do you want to delete this category? If you delete the category, all subcategories will be deleted and also all products under this category will be deleted."),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: const Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          )),
                                                      TextButton(
                                                          onPressed: () async {
                                                            Get.back();
                                                            await controller
                                                                .deleteMainCategory(
                                                                data.id
                                                                    .toString());

                                                          },
                                                          child: const Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .red),
                                                          )),
                                                    ]
                                                );
                                              },
                                              icon: controller.isDataDeleting.value
                                                  ? CircularProgressIndicator()
                                                  : Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                      size: 20,
                                                    ));
                                        }
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///sub category name image
                          const SizedBox(
                            height: 15,
                          ),
                          data.subCategories!.isEmpty ? Center() : SizedBox(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.subCategories!.length,
                                itemBuilder: (context, subIndex) {
                                  var subCat = data.subCategories![subIndex];
                                  return  Container(
                                    height: 50,
                                    margin: const EdgeInsets.only(
                                        left: 40, bottom: 5),
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      borderRadius:
                                      BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            AppNetworkImage(image: subCat.image!, height: 30, width: 30,),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${subCat.name}",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 50,
                                          height: 40,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                      title: "Are You sure?",
                                                      content: const Text(
                                                          "Do you want to delete this category?"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: const Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )),
                                                        TextButton(
                                                            onPressed: () async {
                                                              Get.back();
                                                              await controller
                                                                  .deleteSubCategory(
                                                                  subCat.id
                                                                      .toString());

                                                            },
                                                            child: const Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            )),
                                                      ]
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 20,
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  });
            }
          }),
        )
      ],
    );
  }
}
