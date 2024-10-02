import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/admin.role.list.model.dart';
import '../controller/admin.role.controller.dart';

class AdminRoleList extends GetView<AdminRoleController> {
  const AdminRoleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonHideUnderline(
        child: DropdownButton2<SingleAdminRole>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: controller.adminRoleListModel.value.data!.map((item) {
            return DropdownMenuItem<SingleAdminRole>(
              value: item,
              child: Text(
                item.name!,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          value: controller.selectedSingleAdminRole.value,
          onChanged: (value) {
            // Check if the value is not null before assigning
            if (value != null) {
              controller.selectedSingleAdminRole.value = value;
            }
          },
          buttonStyleData:  ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300)
              )
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      );
    }
    );

  }
}
