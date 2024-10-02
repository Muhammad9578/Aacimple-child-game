import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void restoreRecord({required VoidCallback onRestore}) {
  Get.defaultDialog(
    title: "Restore Message",
    titleStyle: const TextStyle(color: Colors.white),
    backgroundColor: ColorHelper.startUpBgColor,
    middleText:
        "Are you sure you want to restore this \nmessage to main database?",
    middleTextStyle: const TextStyle(color: Colors.white),
    radius: 10.0,
    confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Background color of the button
        ),
        onPressed: onRestore,
        child: const Text(
          "Restore",
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
