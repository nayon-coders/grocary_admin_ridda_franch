
import 'package:flutter/material.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/dropdown2.dart';
import '../../../comman/app_button.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({super.key});

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  //checkbox
    bool check = true;

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  //dropdown
  final List<String> items = ['Item1', 'Item2', 'Item3', 'Item4'];

  String? selectedValue;

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

            const Text("Add User",
              style: TextStyle(fontSize:20,fontWeight: FontWeight.w700,color: Colors.black ),),
            const SizedBox(height: 30,),

            Container(
              padding:const EdgeInsets.all(15),
              width: MediaQuery.sizeOf(context).width*.60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.grey.shade100,

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //first name
                 const Text("First Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                 const SizedBox(height: 10,),
                  AppInput(hint: "First Name", controller: _firstName),
                  const SizedBox(height: 15,),

                  //last name
                  const Text("Last Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "Last Name", controller: _lastName),
                  const SizedBox(height: 15,),

                  //email
                  const Text("Email ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "Email", controller: _email),
                  const SizedBox(height: 15,),

                  //password
                  const Text("Password",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),
                  const SizedBox(height: 10,),
                  AppInput(hint: "Password", controller: _password),
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
                  DropDown2(items: items, hint: "select role", onChange: (v){
                    setState(() {
                      selectedValue = v;
                    });
                  }),
                  SizedBox(height: 20,),

                  ///choose permission
                  const Text("Choose permission"),
                 const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width*.25,
                        child: CheckboxListTile(
                            value: check,
                            onChanged: (c){setState(() {
                          check =c!;
                        });},
                          title:const Text("Dashboard"),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),

                      ),
                      SizedBox(
                        width: size.width*.25,
                        child: CheckboxListTile(

                          value: check,
                          onChanged: (newValue) {
                            setState(() {
                              check = newValue!;
                            });
                          },
                          title:const Text("Product Management"),
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        )
                      ),
                    ],
                  ),

                 const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width*.25,
                        child: CheckboxListTile(
                          value: check,
                          onChanged: (c){setState(() {
                            check =c!;
                          });},
                          title:const Text("Order management"),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),

                      ),
                      SizedBox(
                          width: size.width*.25,
                          child: CheckboxListTile(

                            value: check,
                            onChanged: (newValue) {
                              setState(() {
                                check = newValue!;
                              });
                            },
                            title:const Text("Customer Management"),
                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width*.25,
                        child: CheckboxListTile(
                          value: check,
                          onChanged: (c){setState(() {
                            check =c!;
                          });},
                          title: Text("invoicing"),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),

                      ),
                      SizedBox(
                          width: size.width*.25,
                          child: CheckboxListTile(

                            value: check,
                            onChanged: (newValue) {
                              setState(() {
                                check = newValue!;
                              });
                            },
                            title: Text("user"),
                            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                          )
                      ),
                    ],
                  ),

                  const SizedBox(height: 40,),


                  AppButton(
                    width: size.width,
                      text:"Submit",
                      onClick:(){},
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
