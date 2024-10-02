import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/Utils/functions.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends GetView<HomeController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper.startUpBgColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: ColorHelper.startUpBgColor,
          title: const Text(
            "SETTINGS",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Obx(() {
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: SwitchListTile(
                        splashRadius: 0,
                        hoverColor: Colors.transparent,
                        title: const Text(
                          'Picture on Message box',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: controller.pictureOnMessageBox.value,
                        onChanged: (value) {
                          controller.pictureOnMessageBox.value = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            const Text(
                              "Duration for presentation(Seconds): ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Expanded(
                              child: Slider(
                                value: controller.presentationDuration.value,
                                onChanged: (value) {
                                  print(value.toString());
                                  controller.presentationDuration.value = value;
                                },
                                min: 2.0,
                                max: 10.0,
                                divisions: 8,
                                label: '${controller.presentationDuration}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: SwitchListTile(
                        splashRadius: 0,
                        hoverColor: Colors.transparent,
                        title: const Text(
                          'Text on Center on Message box',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: controller.textOnCenterOfMessageBox.value,
                        onChanged: (value) {
                          controller.textOnCenterOfMessageBox.value = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: SwitchListTile(
                        splashRadius: 0,
                        hoverColor: Colors.transparent,
                        title: const Text(
                          'Listen to sound from Message box',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: controller.listenAudiofromMessageBox.value,
                        onChanged: (value) {
                          controller.listenAudiofromMessageBox.value = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: ListTile(
                        onTap: () {
                          HelperFunctions().openColorPicker(true, true);
                        },
                        leading: Container(
                          width: 100,
                          height: 100,
                          color: controller.messageBoxFontColor.value,
                        ),
                        title: const Text(
                          'Pick Font Color',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: ListTile(
                        onTap: () {
                          HelperFunctions().openColorPicker(false, true);
                        },
                        leading: Container(
                          width: 100,
                          height: 100,
                          color: controller.messageBoxBackgroundColor.value,
                        ),
                        title: const Text(
                          'Pick background Color',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            const Text(
                              "Font Size: ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Expanded(
                              child: Slider(
                                value: controller.messageBoxFontSize.value,
                                onChanged: (value) {
                                  controller.messageBoxFontSize.value = value;
                                },
                                min: 10.0,
                                max: 18.0,
                                divisions: 8,
                                label: '${controller.messageBoxFontSize}',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: DropdownButtonFormField<String>(
                        value: controller.messageBoxFont.value,
                        onChanged: (value) {
                          controller.messageBoxFont.value = value!;
                        },
                        dropdownColor: ColorHelper.startUpBgColor,
                        items: ['Tahoma', 'Calibri', 'Arial'].map((lang) {
                          return DropdownMenuItem<String>(
                            value: lang,
                            child: Text(
                              lang,
                              style: const TextStyle(color: Colors.white),
                            )
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          fillColor: ColorHelper.startUpBgColor,
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Select Language',
                          border: InputBorder.none,
                        ),
                        elevation: 5, // Set the elevation for the dropdown menu
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ), // Optional: Add an icon
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: SwitchListTile(
                        splashRadius: 0,
                        hoverColor: Colors.transparent,
                        title: const Text(
                          'Randomize Message boxses',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: controller.randomizeMessageBoxses.value,
                        onChanged: (value) {
                          controller.randomizeMessageBoxses.value = value;
                        },
                      ),
                    ),
                  ],
                ));
          }),
        ));
  }
}
