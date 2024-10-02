import 'dart:io';
import 'dart:math';

import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/strings.dart';

class TwoActivityView extends GetView<HomeController> {
  const TwoActivityView({super.key});

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
              //   child: Icon(
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
                      if (controller.selectedIndex.value != 0) {
                        if (controller.selectedIndex.value == 1) {
                          controller.selectedIndex.value -= 1;
                        } else {
                          controller.selectedIndex.value -= 2;
                        }
                      }
                    },
                    child: SizedBox(
                        height: Get.height * .15,
                        child: Image.asset("assets/images/fast-forward.png")),
                  ),
                  InkWell(
                    onTap: () {
                      print(
                          controller.allPhrases[controller.selectedIndex.value]
                              [Strings.isSoundEnabled]);
                      if (controller.allPhrases[controller.selectedIndex.value]
                              [Strings.isSoundEnabled] ==
                          1) {
                        controller.speak(controller
                                .allPhrases[controller.selectedIndex.value]
                            [Strings.phrase]);
                      }
                    },
                    child: Container(
                        color: Color(int.parse(controller
                            .allPhrases[controller.selectedIndex.value]
                                [Strings.bgColor]
                            .toString())),
                        height: Get.height * .5,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  child:controller.allPhrases[
                                          controller.selectedIndex.value]
                                      [Strings.picturePath].toString().contains("assets")?Image.asset(controller.allPhrases[
                                          controller.selectedIndex.value]
                                      [Strings.picturePath]): Image.file(File(controller.allPhrases[
                                          controller.selectedIndex.value]
                                      [Strings.picturePath]))),
                            ),
                            Text(
                              controller
                                  .allPhrases[controller.selectedIndex.value]
                                      [Strings.phrase]
                                  .toString(),
                              style: TextStyle(
                                  fontFamily: controller.messageBoxFont.value,
                                  color: Color(int.parse(controller.allPhrases[
                                          controller.selectedIndex.value]
                                          [Strings.fontColor]
                                      .toString())),
                                  fontSize: double.parse(controller.allPhrases[
                                          controller.selectedIndex.value]
                                          [Strings.fontSize]
                                      .toString())),
                            )
                          ],
                        )),
                  ),
                  controller.selectedIndex.value + 1 <
                          controller.allPhrases.length
                      ? InkWell(
                          onTap: () {
                            print(controller
                                    .allPhrases[controller.selectedIndex.value]
                                [Strings.isSoundEnabled]);
                            if (controller.allPhrases[controller.selectedIndex
                                    .value][Strings.isSoundEnabled] ==
                                1) {
                              controller.speak(controller.allPhrases[controller
                                  .selectedIndex.value+1][Strings.phrase]);
                            }
                          },
                          child: Container(
                              color: Color(int.parse(controller.allPhrases[
                                      controller.selectedIndex.value + 1]
                                      [Strings.bgColor]
                                  .toString())),
                              height: Get.height * .5,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                        child:controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    1][Strings.picturePath].toString().contains("assets")?Image.asset(controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    1][Strings.picturePath]): Image.file(File(
                                            controller.allPhrases[
                                                controller.selectedIndex.value +
                                                    1][Strings.picturePath]))),
                                  ),
                                  Text(
                                    controller.allPhrases[
                                            controller.selectedIndex.value + 1]
                                            [Strings.phrase]
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: controller.messageBoxFont.value,
                                        color: Color(int.parse(controller
                                            .allPhrases[
                                                controller.selectedIndex.value + 1]
                                                [Strings.fontColor]
                                            .toString())),
                                        fontSize: double.parse(controller
                                            .allPhrases[
                                                controller.selectedIndex.value +
                                                    1][Strings.fontSize]
                                            .toString())),
                                  )
                                ],
                              )),
                        )
                      : const SizedBox(),
                  InkWell(
                    onTap: () {
                      // if (controller.selectedIndex.value !=
                      //     controller.allPhrases.length - 2) {
                      //   if (controller.allPhrases.length % 2 != 0) {
                      //     controller.selectedIndex.value += 1;
                      //   } else {
                      //     controller.selectedIndex.value += 2;
                      //   }
                      // }

                      if (controller.selectedIndex.value <
                          controller.allPhrases.length - 2) {
                        if (controller.allPhrases.length % 2 != 0) {
                          controller.selectedIndex.value += 2;
                        } else {
                          controller.selectedIndex.value += 2;
                        }
                      }
                    },
                    child: Transform.rotate(
                      angle: 180 * pi / 180,
                      child: SizedBox(
                        height: Get.height * .15,
                        child: Image.asset("assets/images/fast-forward.png"),
                      ),
                    ),
                  )
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
