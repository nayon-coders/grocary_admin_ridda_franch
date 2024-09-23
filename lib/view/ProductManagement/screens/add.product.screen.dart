

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/dropdown2.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final _name = TextEditingController();
  final _unit = TextEditingController();
  final _longDescription = TextEditingController();
  final _regularPrice = TextEditingController();
  final _wholeSellPrice = TextEditingController();
  final _sellerPrice = TextEditingController();
  final _perchasePrice = TextEditingController();
  final _discountPrice = TextEditingController();
  final _inStock = TextEditingController();

  ///DropdownButton

  List category = ["category", "category", "category", "category",];
  List subCategory = ["category", "category", "category", "category",];
  List vatList = ["category", "category", "category", "category",];
  List unitList = ["category", "category", "category", "category",];
  List paysList = ["category", "category", "category", "category",];

  String? _caregory;
  String? _subCaregory;
  String? _vatList;
  String? _pays;
  String? _unitList;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //title Text
              const Text(
                "Add New Product",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),


              const SizedBox(height: 20,),


              SizedBox(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                    //left side
                    Expanded(
                      child: Container(
                        padding:const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            const Text("Caractéristiques",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black),
                            ),

                            const SizedBox(height: 20,),

                            const Text(
                              "Fiche Produit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AppInput(controller: _name, hint: "Product name"),



                            const SizedBox(
                              height: 10,
                            ),


                            const Text(
                              "Conditionnement",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5,),

                            //short description Dropdown

                            DropDown2(items: category, hint: "Conditionnement", onChange: (v){setState(() {
                              _caregory = v;
                            });}),
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton2<String>(
                            //     isExpanded: true,
                            //     hint: Text(
                            //       'Conditionnement',
                            //       style: TextStyle(
                            //         fontSize: 14,
                            //         color: Theme.of(context).hintColor,
                            //       ),
                            //     ),
                            //     items: category
                            //         .map((item) => DropdownMenuItem<String>(
                            //               value: item,
                            //               child: Text(
                            //                 item,
                            //                 style: const TextStyle(
                            //                   fontSize: 14,
                            //                 ),
                            //               ),
                            //             ))
                            //         .toList(),
                            //     value: _caregory,
                            //     onChanged: (String? value) {
                            //       setState(() {
                            //         _caregory = value;
                            //       });
                            //     },
                            //     buttonStyleData: ButtonStyleData(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 16),
                            //         height: 40,
                            //         width: double.infinity,
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(5),
                            //             border: Border.all(width: 1, color: Colors.grey.shade200))),
                            //     menuItemStyleData: const MenuItemStyleData(
                            //       height: 40,
                            //     ),
                            //   ),
                            // ),

                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Descriptif Produit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            AppInput(
                              hint: "Une description longue de votre produit (min 200 caractères)",
                              controller: _longDescription,
                              maxLine: 6,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            //unit field
                           const Text(
                              "Poids en Kg, Contenance en L ou Unité",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AppInput(hint: "Unit", controller: _unit),
                            //AppInputField(controller: _unit, hintText: "Unit",),
                            const SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                              height: 85,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Unité du Produit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            'Choisir',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: unitList
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: _unitList,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _unitList = value;
                                            });
                                          },
                                          buttonStyleData: ButtonStyleData(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              height: 40,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors
                                                          .grey.shade200))),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),

                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "En stock",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      AppInput(hint: "1000", controller: _inStock),
                                      //AppInputField(controller: _inStock, hintText: "1000", maxLine: 1,),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 85,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Origine",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      //Country List

                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            'Pays',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: paysList
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: _pays,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _pays = value;
                                            });
                                          },
                                          buttonStyleData: ButtonStyleData(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              height: 40,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors
                                                          .grey.shade200))),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                      //AppInputField(controller: _country, hintText: "Pays", maxLine: 1,),
                                    ],
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),


                                      const Text(
                                        "TVA %",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            '0.0 %',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),

                                          ///TODO:Check Country List
                                          items: vatList
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: _vatList,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _vatList = value;
                                            });
                                          },
                                          buttonStyleData: ButtonStyleData(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              height: 40,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors
                                                          .grey.shade200))),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),

                                      // AppInput(hint: "0.0 %", controller: _tax),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Images produits",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade200)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {},
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: Colors.green)),
                                        child: const Center(
                                          child: Icon(
                                            Icons.upload_outlined,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Expanded(
                                    //   child: ListView.builder(
                                    //     itemCount: 1,
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemBuilder: (_, index) {
                                    //       return Stack(
                                    //         children: [
                                    //           Container(
                                    //             width: 100,
                                    //             height: 100,
                                    //             margin:
                                    //                 const EdgeInsets.all(10),
                                    //             decoration: BoxDecoration(
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(
                                    //                         10),
                                    //                 border: Border.all(
                                    //                     width: 1,
                                    //                     color: Colors.green)),
                                    //             child: Center(),
                                    //           ),
                                    //           Positioned(
                                    //             right: 15,
                                    //             top: 15,
                                    //             child: Container(
                                    //               decoration: BoxDecoration(
                                    //                   color: Colors.white,
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           100)),
                                    //               child: IconButton(
                                    //                   onPressed: () {
                                    //                     setState(() {});
                                    //                   },
                                    //                   icon: Icon(
                                    //                     Icons.delete,
                                    //                     color: Colors.red,
                                    //                   )),
                                    //             ),
                                    //           )
                                    //         ],
                                    //       );
                                    //     },
                                    //   ),
                                    // )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),


                    const SizedBox(width: 20,),

                    //Right Side
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //pricing part
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10)),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                 const Text("Prix",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),


                                 const SizedBox(height: 20,),
                                  SizedBox(
                                    width: 230,
                                    height: 75,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                       const Text(
                                          "Prix d'achat ht",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),

                                        AppInput(hint: "Prix d'achat ht", controller: _perchasePrice)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                          const  Text(
                                              "Prix Revendeurs (+25%)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                           const SizedBox(height: 5,),
                                            AppInput(hint: "Prix Revendeurs", controller: _sellerPrice,readOnly: true,)

                                          ],
                                        ),
                                      ),
                                    const  SizedBox(width: 10,),

                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                          const  Text(
                                              "Prix Restaurants (+42%)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                           const SizedBox(
                                              height: 5,
                                            ),
                                            AppInput(hint: "Prix", controller: _regularPrice,readOnly: true,),
                                            //AppInputField(controller: _regularPrice, hintText: "Prix Restaurants", readOnly:  true,),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                 const SizedBox(height: 10,),



                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                           const Text(
                                              "Prix Grossistes (+15%)",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                           const SizedBox(
                                              height: 5,
                                            ),
                                            AppInput(hint: "Prix Grossistes", controller: _wholeSellPrice,readOnly: true,),

                                          ],
                                        ),
                                      ),

                                     const SizedBox(width: 10),

                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                           const Text(
                                              "Remise en %",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            AppInput(controller: _discountPrice, hint: "Remise en %"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      "Choisir une ou Plusieurs Catégories",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: double.infinity,
                                      //height: 40,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        //color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade200),
                                      ),
                                      child: const Text(
                                        'name',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        'Sous Catégorie',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: subCategory
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text("",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: _subCaregory,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _subCaregory = value;
                                        });
                                      },
                                      buttonStyleData: ButtonStyleData(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade200))),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                 const SizedBox(
                                    height: 10,
                                  ),
                                  // ListView.builder(
                                  //   physics:const NeverScrollableScrollPhysics(),
                                  //   shrinkWrap: true,
                                  //   itemCount: 1,
                                  //   itemBuilder: (_, index) {
                                  //     return Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           Text(""),
                                  //           Icon(
                                  //             Icons.delete,
                                  //             color: Colors.red,
                                  //           )
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  // )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                  ),
              ),

             //add Product button
             const SizedBox(height: 30,),
              InkWell(
                onTap: (){},

                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:const Center(child:  Text("Add Product",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),),
                ),
              )
            ],

        ),
      ),
    );
  }


}
