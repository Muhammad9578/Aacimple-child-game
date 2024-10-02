import 'dart:io';
import 'dart:math';

import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/strings.dart';

class TwelveActivityView extends GetView<HomeController> {
  const TwelveActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper.startUpBgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
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
                    const SizedBox(
                      width: 20,
                    ),
                     InkWell(
                      onTap: () {
                        // Check if not at the beginning of the list
                        if (controller.selectedIndex.value >= 12) {
                          controller.selectedIndex.value -= 12;
                        }
                      },
                      child: SizedBox(
                        height: Get.height * .15,
                        child: Image.asset("assets/images/fast-forward.png"),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // Check if there are at least 12 more phrases to navigate forward
                        if (controller.selectedIndex.value + 12 <
                            controller.allPhrases.length) {
                          controller.selectedIndex.value += 12;
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
                const Spacer(),
                Obx(() {
                  int start = controller.selectedIndex.value;
                  int end = start + 12;
                  if (end > controller.allPhrases.length) {
                    end = controller.allPhrases.length;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = start; i < start + 6 && i < end; i++)
                                InkWell(
                                  onTap: () {
                                    print(i);
                                    if (controller.allPhrases[i]
                                            [Strings.isSoundEnabled] ==
                                        1) {
                                      controller.speak(controller.allPhrases[i]
                                          [Strings.phrase]);
                                    }
                                  },
                                  child: Container(
                                    color: Color(int.parse(controller
                                        .allPhrases[i][Strings.bgColor]
                                        .toString())),
                                    height: Get.height * .32,
                                    width: Get.width * .15,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child:controller.allPhrases[i]
                                                  [Strings.picturePath].contains("assets")?Image.asset(controller.allPhrases[i]
                                                  [Strings.picturePath]): Image.file(
                                              File(controller.allPhrases[i]
                                                  [Strings.picturePath]),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          controller.allPhrases[i]
                                                  [Strings.phrase]
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: controller
                                                  .messageBoxFont.value,
                                              color: Color(int.parse(controller
                                                  .allPhrases[i]
                                                      [Strings.fontColor]
                                                  .toString())),
                                              fontSize: double.parse(controller
                                                  .allPhrases[i]
                                                      [Strings.fontSize]
                                                  .toString())),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = start + 6; i < end; i++)
                                InkWell(
                                  onTap: () {
                                    print(i);
                                    if (controller.allPhrases[i]
                                            [Strings.isSoundEnabled] ==
                                        1) {
                                      controller.speak(controller.allPhrases[i]
                                          [Strings.phrase]);
                                    }
                                  },
                                  child: Container(
                                    color: Color(int.parse(controller
                                        .allPhrases[i][Strings.bgColor]
                                        .toString())),
                                    height: Get.height * .32,
                                    width: Get.width * .15,
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child:controller.allPhrases[i]
                                                  [Strings.picturePath].contains("assets")?Image.asset(controller.allPhrases[i]
                                                  [Strings.picturePath]): Image.file(
                                              File(controller.allPhrases[i]
                                                  [Strings.picturePath]),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          controller.allPhrases[i]
                                                  [Strings.phrase]
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: controller
                                                  .messageBoxFont.value,
                                              color: Color(int.parse(controller
                                                  .allPhrases[i]
                                                      [Strings.fontColor]
                                                  .toString())),
                                              fontSize: double.parse(controller
                                                  .allPhrases[i]
                                                      [Strings.fontSize]
                                                  .toString())),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const Spacer()
              ],
            ),
          ),
        ));
  }
}
