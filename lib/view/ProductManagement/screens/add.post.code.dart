import 'package:flutter/material.dart';

import '../../../comman/app.input.dart';
import '../../../comman/app_button.dart';
import '../../../comman/title_text.dart';

class AddPostCode extends StatefulWidget {
  const AddPostCode({super.key});

  @override
  State<AddPostCode> createState() => _AddPostCodeState();
}

class _AddPostCodeState extends State<AddPostCode> {
  final _postCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    child: AppInput(controller: _postCode, hint: "Post Code")),
                SizedBox(width: 20,),
                AppButton(onClick: (){}, width: 200, text: "Add Now"),
              ],
            ),
          ),
          SizedBox(height: 20,),
          // Expanded(
          //   flex: 8,
          //   child: ListView.builder(
          //         itemCount: 1,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text("name"),
          //             trailing: IconButton(
          //               onPressed: (){},
          //               icon: Icon(Icons.delete, color: Colors.red,),
          //             ),
          //           );
          //         }
          //     ),
          //
          // )


        ],
      ),
    );
  }
}
