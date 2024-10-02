import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/strings.dart';

class OneActivityView extends StatefulWidget {
  const OneActivityView({super.key});

  @override
  State<OneActivityView> createState() => _OneActivityViewState();
}

class _OneActivityViewState extends State<OneActivityView> {
  Timer? timer;

  RxBool isTimer = false.obs;
  HomeController homeController = Get.find();
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
              InkWell(
                onTap: () {
                  isTimer.value = true;
                  timer = Timer.periodic(
                      Duration(
                          seconds: homeController.presentationDuration.value
                              .toInt()), (timer) {
                    if (homeController.selectedIndex.value !=
                        homeController.allPhrases.length - 1) {
                      homeController.selectedIndex.value += 1;
                    } else {
                      timer.cancel();
                      isTimer.value = false;
                    }
                  });
                },
                child: Container(
                  color: Colors.orange,
                  height: Get.height * .15,
                  width: Get.height * .25,
                  child: const Icon(
                    CupertinoIcons.power,
                    color: Color.fromARGB(255, 71, 142, 72),
                    size:40,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  isTimer.value = false;
                  timer?.cancel();
                },
                child: Container(
                  color: Colors.orange,
                  height: Get.height * .15,
                  width: Get.height * .25,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset("assets/images/stop.png"),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isTimer.isTrue
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            if (homeController.selectedIndex.value != 0) {
                              homeController.selectedIndex.value -= 1;
                            }
                          },
                          child: Transform.rotate(
                            angle: 180 * pi / 180,
                            child: SizedBox(
                              height: Get.height * .15,
                              child:
                                  Image.asset("assets/images/fast-forward.png"),
                            ),
                          ),
                        ),
                  InkWell(
                    onTap: () {
                      // print(homeController
                      //         .allPhrases[homeController.selectedIndex.value]
                      //     [Strings.isSoundEnabled]);
                      if (homeController.allPhrases[homeController.selectedIndex
                                  .value][Strings.isSoundEnabled] ==
                              1 &&
                          homeController.listenAudiofromMessageBox.isTrue) {
                        homeController.speak(homeController
                                .allPhrases[homeController.selectedIndex.value]
                            [Strings.phrase]);
                      }
                    },
                    // onTap: () => homeController.playPause(homeController
                    //     .allPhrases[homeController.selectedIndex.value]
                    //         [Strings.soundPath]
                    //     .toString()),
                    child: Container(
                        color: Color(int.parse(homeController
                            .allPhrases[homeController.selectedIndex.value]
                                [Strings.bgColor]
                            .toString())),
                        height: Get.height * .6,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                  child:homeController.allPhrases[homeController
                                          .selectedIndex
                                          .value][Strings.picturePath].toString().contains("assets")?Image.asset(homeController.allPhrases[homeController
                                          .selectedIndex
                                          .value][Strings.picturePath]): Image.file(File(
                                      homeController.allPhrases[homeController
                                          .selectedIndex
                                          .value][Strings.picturePath]))),
                            ),
                            Text(
                              homeController.allPhrases[homeController
                                      .selectedIndex.value][Strings.phrase]
                                  .toString(),
                              style: TextStyle(
                                  color: Color(int.parse(homeController
                                      .allPhrases[homeController.selectedIndex.value]
                                          [Strings.fontColor]
                                      .toString())),
                                  fontSize: double.parse(homeController
                                      .allPhrases[homeController.selectedIndex
                                          .value][Strings.fontSize]
                                      .toString()),
                                  fontFamily:
                                      homeController.messageBoxFont.value),
                            )
                          ],
                        )),
                  ),
                  isTimer.isTrue
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            if (homeController.selectedIndex.value !=
                                homeController.allPhrases.length - 1) {
                              homeController.selectedIndex.value += 1;
                              // print(homeController.allPhrases[homeController
                              //         .selectedIndex.value][Strings.fontSize]
                              //     .toString());
                            }
                          },
                          child: SizedBox(
                              height: Get.height * .15,
                              child: Image.asset(
                                  "assets/images/fast-forward.png")))
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
