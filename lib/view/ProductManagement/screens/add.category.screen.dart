import 'dart:html';

import 'package:flutter/material.dart';
import 'package:minia_web_project/comman/app_button.dart';
import 'package:minia_web_project/comman/app_network_image.dart';
import 'package:minia_web_project/comman/title_text.dart';
import 'package:minia_web_project/utility/app.assets.dart';

import '../../../comman/app.input.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({super.key});

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  final  _categoryName = TextEditingController();
  final  _subCategoryName = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        Container(
                          width: 350,
                          height: 350,
                          margin:const EdgeInsets.only(bottom: 20),
                          padding:const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Text("Add New Category",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black ),),
                              const SizedBox(height: 20,),

                              InkWell(
                                onTap: (){},
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1, color: Colors.grey),
                                  ),
                                  child: const Center(
                                    child:  Icon(Icons.upload_outlined, color: Colors.grey, size: 80,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Expanded(
                                child: AppInput(
                                  controller: _categoryName,
                                  hint: "Category Name",
                                ),
                              ),

                             const SizedBox(height: 20,),
                              AppButton(onClick: (){}, text: "Add"),

                            ],
                          ),
                        ),
                       const SizedBox(height: 10,),

                        //add sub category
                        Container(
                          width: 350,
                          height: 350,
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
                              const Text("Add New Category",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black ),),
                              const SizedBox(height: 20,),

                              InkWell(
                                onTap: (){},
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1, color: Colors.grey),
                                  ),
                                  child: const Center(
                                    child:  Icon(Icons.upload_outlined, color: Colors.grey, size: 60,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Expanded(
                                child: AppInput(
                                  controller: _subCategoryName,
                                  hint: "SubCategory Name",
                                ),
                              ),
                             const SizedBox(height: 10,),
                              Expanded(
                                child: AppInput(
                                  controller: _categoryName,
                                  hint: "Select Category",
                                  readOnly: true,
                                ),
                              ),

                              const SizedBox(height: 20,),
                              AppButton(onClick: (){}, text: "Add"),

                            ],
                          ),
                        ),




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
                        child: ListView(
                          children: [
                            const Text("All Category",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black,)),
    
                            SizedBox(
                              child: ListView.builder(
                                  physics:const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context,index){
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  padding:const EdgeInsets.all(10),
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade100,
                                  ),
                                  child:  Column(
                                    children: [
    
                                      ///category name
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                             Image.asset("assets/image/avatar.png",height: 50,width: 50,fit: BoxFit.cover,),
    
                                              const SizedBox(width: 10,),
    
                                              Text("Category Name",
                                                style:const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
    
    
    
    
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,width: 110,
                                            child: Row(
                                              children: [
                                                IconButton(onPressed: (){}, icon:const Icon(Icons.edit,color: Colors.amber,size: 20,)),
                                                IconButton(onPressed: (){}, icon:const Icon(Icons.delete,color: Colors.red,size: 20,)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
    
    
    
                                      ///sub category name image
                                     const SizedBox(height: 15,),
                                      Container(
                                        height: 50,
                                        margin:const EdgeInsets.only(left: 40,bottom: 5),
                                        padding:const EdgeInsets.only(left: 10,right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade50,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset("assets/image/avatar.png",height: 40,width: 40,),
                                                SizedBox(width: 10,),
                                                Text("sub category name",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                              height: 40,
                                              child: Row(
                                                children: [
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red, size: 20,)),
                                                ],
                                              ),
                                            )
    
    
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
