import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitySelectionButton extends StatelessWidget {
  const ActivitySelectionButton(
      {super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: Get.height * .25,
        width: Get.height * .25,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
