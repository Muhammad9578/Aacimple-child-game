import 'dart:io';
import 'dart:math';

import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/strings.dart';

class FourActivityView extends GetView<HomeController> {
  const FourActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.startUpBgColor,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Container(
                  color: Colors.orange,
                  height: Get.height * .15,
                  width: Get.height * .25,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/gear-solid.svg",
                      height: Get.height * .12,
                      width: Get.height * .15,
                    ),
                  ),
                ),
              ),
              // Container(
              //   color: Colors.orange,
              //   height: Get.height * .15,
              //   width: Get.height * .25,
              //   child: const Icon(
              //     CupertinoIcons.power,
              //     color: Colors.green,
              //     size: 32,
              //   ),
              // ),
              // Container(
              //   color: Colors.orange,
              //   height: Get.height * .15,
              //   width: Get.height * .25,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Image.asset("assets/images/stop.png"),
              //   ),
              // ),
            ],
          ),
          const Spacer(),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // Check if not at the beginning of the list
                      if (controller.selectedIndex.value >= 4) {
                        controller.selectedIndex.value -= 4;
                      }
                    },
                    child: SizedBox(
                      height: Get.height * .15,
                      child: Image.asset("assets/images/fast-forward.png"),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 2; i++)
                            if (controller.selectedIndex.value + i <
                                controller.allPhrases.length)
                              InkWell(
                                onTap: () {
                                  print(controller.allPhrases[
                                          controller.selectedIndex.value + i]
                                      [Strings.isSoundEnabled]);
                                  if (controller.allPhrases[
                                          controller.selectedIndex.value +
                                              i][Strings.isSoundEnabled] ==
                                      1) {
                                    controller.speak(controller.allPhrases[
                                            controller.selectedIndex.value + i]
                                        [Strings.phrase]);
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  color: Color(int.parse(controller.allPhrases[
                                          controller.selectedIndex.value + i]
                                          [Strings.bgColor]
                                      .toString())),
                                  height: Get.height * .35,
                                  width: Get.width * .25,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child:controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    i][Strings.picturePath].contains("assets")?Image.asset(controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    i][Strings.picturePath]): Image.file(
                                            File(controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    i][Strings.picturePath]),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.allPhrases[
                                            controller.selectedIndex.value +
                                                i][Strings.phrase],
                                        style: TextStyle(

                                            fontFamily:
                                                controller.messageBoxFont.value,
                                            color: Color(int.parse(controller
                                                .allPhrases[
                                                    controller.selectedIndex.value + i]
                                                    [Strings.fontColor]
                                                .toString())),
                                            fontSize: double.parse(controller
                                                .allPhrases[
                                                    controller.selectedIndex.value + i]
                                                    [Strings.fontSize]
                                                .toString())),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          for (int i = 2; i < 4; i++)
                            if (controller.selectedIndex.value + i <
                                controller.allPhrases.length)
                              InkWell(
                                onTap: () {
                                  print(controller.allPhrases[
                                          controller.selectedIndex.value + i]
                                      [Strings.isSoundEnabled]);
                                  if (controller.allPhrases[
                                          controller.selectedIndex.value +
                                              i][Strings.isSoundEnabled] ==
                                      1) {
                                    controller.speak(controller.allPhrases[
                                            controller.selectedIndex.value + i]
                                        [Strings.phrase]);
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  color: Color(int.parse(controller.allPhrases[
                                          controller.selectedIndex.value + i]
                                          [Strings.bgColor]
                                      .toString())),
                                  height: Get.height * .35,
                                  width: Get.width * .25,
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child:controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    i][Strings.picturePath].contains("assets")?Image.asset(controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    i][Strings.picturePath]): Image.file(
                                            File(controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    i][Strings.picturePath]),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.allPhrases[
                                            controller.selectedIndex.value +
                                                i][Strings.phrase],
                                        style: TextStyle(  fontFamily: controller.messageBoxFont.value,
                                            color: Color(int.parse(controller
                                                .allPhrases[
                                                    controller.selectedIndex.value + i]
                                                    [Strings.fontColor]
                                                .toString())),
                                            fontSize: double.parse(controller
                                                .allPhrases[
                                                    controller.selectedIndex.value + i]
                                                    [Strings.fontSize]
                                                .toString())),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // Check if there are at least 4 more phrases to navigate forward
                      if (controller.selectedIndex.value + 4 <
                          controller.allPhrases.length) {
                        controller.selectedIndex.value += 4;
                      }
                    },
                    child: Transform.rotate(
                      angle: 180 * pi / 180,
                      child: SizedBox(
                        height: Get.height * .15,
                        child: Image.asset("assets/images/fast-forward.png"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const Spacer()
        ],
      )),
    );
  }
}
