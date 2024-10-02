import 'dart:io';

import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/Utils/strings.dart';
import 'package:aacimple/app/Utils/widgets/restore_dialog.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OldDbItemDetail extends StatelessWidget {
  OldDbItemDetail({super.key});
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.startUpBgColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.white,
                  height: Get.height * .9,
                  width: Get.width * .5,
                  child:homeController.selectedDbItem[Strings.picturePath].toString().contains("assets")?Image.asset(homeController.selectedDbItem[Strings.picturePath]): Image.file(
                      File(homeController.selectedDbItem[Strings.picturePath])),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 3),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "Keyfield Code: 00${homeController.selectedDbItem[Strings.id]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 3),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "Phrase Text: ${homeController.selectedDbItem[Strings.phrase]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 3),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: InkWell(
                            onTap: () => homeController.speak(
                                homeController.selectedDbItem[Strings.phrase]),
                            // onTap: () => homeController.playPause(homeController
                            //     .selectedDbItem[Strings.soundPath]),
                            child: Icon(
                              homeController.isPlaying.isTrue
                                  ? Icons.stop
                                  : Icons.play_arrow,
                              color: homeController.isPlaying.isTrue
                                  ? Colors.red
                                  : Colors.white,
                              size: 36,
                            ),
                          ));
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: Get.width * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              restoreRecord(onRestore: () {
                                homeController.selectedLanguage.value =
                                    homeController
                                        .selectedDbItem[Strings.language];
                                homeController.phraseController.text =
                                    homeController
                                        .selectedDbItem[Strings.phrase];
                                homeController.phraseImage.value =
                                    homeController
                                        .selectedDbItem[Strings.picturePath];
                                homeController.phraseAudio = homeController
                                    .selectedDbItem[Strings.soundPath];
                                homeController.pictureSwitch.value =
                                    homeController.selectedDbItem[
                                                Strings.isPictureVisible] ==
                                            1
                                        ? true
                                        : false;
                                homeController.textSwitch.value =
                                    homeController.selectedDbItem[
                                                Strings.isTextVisible] ==
                                            1
                                        ? true
                                        : false;
                                homeController.soundSwitch.value =
                                    homeController.selectedDbItem[
                                                Strings.isSoundEnabled] ==
                                            1
                                        ? true
                                        : false;
                                homeController.selectedFontSize.value =
                                    double.parse(homeController
                                        .selectedDbItem[Strings.fontSize]
                                        .toString());
                                homeController.selectedFontColor.value = Color(
                                    int.parse(homeController
                                        .selectedDbItem[Strings.fontColor]));
                                homeController.selectedBackgroundColor.value =
                                    Color(int.parse(homeController
                                        .selectedDbItem[Strings.bgColor]));

                                homeController.insertPhrase(true);
                                homeController.deleteSamplePhrase(false,
                                    homeController.selectedDbItem[Strings.id]);

                                Get.back();
                                Get.back(result: true);
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: Get.width * .12,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: ColorHelper.primaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text(
                                  'Restore',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorHelper.primaryColor,
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
    );
  }
}
