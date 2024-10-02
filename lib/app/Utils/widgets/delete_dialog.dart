import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void deleteRecord({required VoidCallback onDelete}) {
  Get.defaultDialog(
    title: "Delete Message",
    titleStyle: const TextStyle(color: Colors.white),
    backgroundColor: ColorHelper.startUpBgColor,
    middleText:
        "Are you sure you want to delete this message? \nDeleted Messages will stored in old messages database, \nyou can restore them ant time",
    middleTextStyle: const TextStyle(color: Colors.white),
    radius: 10.0,
    confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Background color of the button
        ),
        onPressed: onDelete,
        child: const Text(
          "Delete",
          style: TextStyle(color: Colors.white),
        )),
    cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Background color of the button
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "Cancel",
          style: TextStyle(color: Colors.black),
        )),
  );
}
