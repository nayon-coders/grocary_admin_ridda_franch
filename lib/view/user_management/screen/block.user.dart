import 'package:flutter/material.dart';

import '../../../comman/app_table/app.table.dart';
import '../../../comman/app_table/table.header.dart';

class AddBlockUser extends StatefulWidget {
  const AddBlockUser({super.key});

  @override
  State<AddBlockUser> createState() => _AddBlockUserState();
}

class _AddBlockUserState extends State<AddBlockUser> {
  final  _searchController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:const EdgeInsets.all(20),
      child: AppTable(
        title: "Block List User",
        headersChildren:const [
          TableHeader(name: "ID", width: 80),
          TableHeader(name: "Name", width: 120),
          TableHeader(name: "Phone", width: 120),
          TableHeader(name: "Email", width: 130),
          TableHeader(name: "PortalCode", width: 120),
          TableHeader(name: "Status", width: 100),
          TableHeader(name: "Date Time ", width: 120),
          TableHeader(name: "Action", width:50),




        ],
        row:Container(
          height: 500,
          child: ListView.builder(
            //data length
            itemCount: 33,
            itemBuilder: (context, index){



              //store data variable
              return Container(
                height: 56,
                margin:const EdgeInsets.only(bottom:5,top: 5),
                padding:const EdgeInsets.only(left: 15, right: 15,bottom: 5,top: 5),
                decoration: BoxDecoration(
                  color:index.isEven?Colors.grey.shade200: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [



                    //Id

                    SizedBox(
                        width: 80,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("${index+108}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


                    //User name
                    SizedBox(
                        width: 120,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("user name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


                    //user phone number

                    SizedBox(
                        width: 120,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("user phone",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),

                    //user Email address

                    SizedBox(
                        width: 130,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Email Address",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


                    //portal code

                    SizedBox(
                        width: 120,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("portal code",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),))),


                    //status

                    SizedBox(
                      width: 100,
                        child: Align(
                          alignment: Alignment.centerLeft,
                            child: Text("Block",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.red),))),




                    //Date Time

                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                          width: 120,
                          child: Text("Date Time",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black),)),
                    ),


                    //Action button
                    SizedBox(
                      width: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(onPressed: (){}, icon:const Icon(Icons.visibility,color: Colors.green,)),
                      ),
                    ),










                  ],
                ),
              );
            },
          ),
        ) ,
        onSearch: (){},
        searchController: _searchController,

      ),

    );
  }
}
