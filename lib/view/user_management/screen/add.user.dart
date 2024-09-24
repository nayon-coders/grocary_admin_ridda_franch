
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
      child: Center(child: Text("Add user "),),
    );
  }
}
