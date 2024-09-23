import 'package:flutter/material.dart';

class AddNewAdmin extends StatefulWidget {
  const AddNewAdmin({super.key});

  @override
  State<AddNewAdmin> createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("add new admin"),);
  }
}
