import 'dart:io';

import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/Utils/functions.dart';
import 'package:aacimple/app/Utils/widgets/default_snackbar.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewMessageView extends StatefulWidget {
  const NewMessageView({super.key, required this.isUpdate});

  final bool isUpdate;

  @override
  _NewMessageViewState createState() => _NewMessageViewState();
}

class _NewMessageViewState extends State<NewMessageView> {
  final HomeController homeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.initializer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          widget.isUpdate ? "UPDATE MESSAGE" : "CREATE NEW MESSAGE",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: ColorHelper.startUpBgColor,
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: DropdownButtonFormField<String>(
                    value: homeController.selectedLanguage.value,
                    onChanged: (value) {
                      homeController.selectedLanguage.value = value!;
                    },
                    dropdownColor: ColorHelper.startUpBgColor,
                    items: ['Greek', 'English', 'Italian'].map((lang) {
                      return DropdownMenuItem<String>(
                        value: lang,
                        child: Text(
                          lang,
                          style: const TextStyle(color: Colors.white),
                        ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: homeController.phraseController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        labelText: 'Type the phrase (Label-text)'),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Add other input fields (Picture, Sound, Switches, Slider, etc.)

                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: ListTile(
                    onTap: HelperFunctions().showOptions,
                    leading: homeController.phraseImage.value == ""||homeController.phraseImage.value.contains("assets")
                        ? Image.asset(homeController.phraseImage.value.contains("assets")?homeController.phraseImage.value:"assets/images/placeholder.png")
                        : Image.file(
                            File(homeController.phraseImage.value),
                            fit: BoxFit.cover,
                          ),
                    title: const Text(
                      'Select Image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // const SizedBox(height: 16.0),
                // Obx(() {
                //   return Container(
                //     decoration:
                //         BoxDecoration(border: Border.all(color: Colors.black)),
                //     child: ListTile(
                //       leading: Visibility(
                //         visible: homeController.isPlaying.isFalse,
                //         child: InkWell(
                //           onTap: homeController.isRecording.value
                //               ? homeController.stopRecording
                //               : homeController.startRecording,
                //           child: Container(
                //             padding: const EdgeInsets.all(4),
                //             decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 border: Border.all(color: Colors.white)),
                //             child: Icon(
                //               homeController.isRecording.value
                //                   ? Icons.stop
                //                   : Icons.mic,
                //               color: Colors.white,
                //               size: 30,
                //             ),
                //           ),
                //         ),
                //       ),
                //       title: const Text(
                //         'Record Audio',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       trailing: Visibility(
                //         visible: homeController.isRecording.isFalse,
                //         child: InkWell(
                //           onTap: () => homeController
                //               .playPause(homeController.phraseAudio),
                //           child: Container(
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   border: Border.all(color: Colors.white)),
                //               child: Icon(
                //                 homeController.isPlaying.isTrue
                //                     ? Icons.stop
                //                     : Icons.play_arrow,
                //                 color: homeController.isPlaying.isTrue
                //                     ? Colors.red
                //                     : Colors.white,
                //                 size: 36,
                //               )),
                //         ),
                //       ),
                //     ),
                //   );
                // }),

                const SizedBox(height: 16.0),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SwitchListTile(
                    splashRadius: 0,
                    hoverColor: Colors.transparent,
                    title: const Text(
                      'Picture ON/OFF',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: homeController.pictureSwitch.value,
                    onChanged: (value) {
                      homeController.pictureSwitch.value = value;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),

                // Switch for Text
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SwitchListTile(
                    title: const Text(
                      'Text ON/OFF',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: homeController.textSwitch.value,
                    onChanged: (value) {
                      homeController.textSwitch.value = value;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),

                // Switch for Sound
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SwitchListTile(
                    title: const Text(
                      'Sound ON/OFF',
                      style: TextStyle(color: Colors.white),
                    ),
                    value: homeController.soundSwitch.value,
                    onChanged: (value) {
                      homeController.soundSwitch.value = value;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        const Text(
                          "Font Size: ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Expanded(
                          child: Slider(
                            value: homeController.selectedFontSize.value,
                            onChanged: (value) {
                              homeController.selectedFontSize.value = value;
                            },
                            min: 10.0,
                            max: 18.0,
                            divisions: 8,
                            label: '${homeController.selectedFontSize}',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: ListTile(
                    onTap: () {
                      HelperFunctions().openColorPicker(true, false);
                    },
                    leading: Container(
                      width: 100,
                      height: 100,
                      color: homeController.selectedFontColor.value,
                    ),
                    title: const Text(
                      'Pick Font Color',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: ListTile(
                    onTap: () {
                      HelperFunctions().openColorPicker(false, false);
                    },
                    leading: Container(
                      width: 100,
                      height: 100,
                      color: homeController.selectedBackgroundColor.value,
                    ),
                    title: const Text(
                      'Pick background Color',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    // try {
                    //   await homeController.audioPlayer
                    //       .setSourceUrl(homeController.phraseAudio);
                    //   Duration? audioDuration =
                    //       await homeController.audioPlayer.getDuration();
                    //   log(audioDuration!.inSeconds.toString());
                    // } catch (e) {

                    // }

                    if (homeController.phraseController.text.isEmpty) {
                      DefaultSnackbar.show("Error", "Enter phrase text");
                    } else if (homeController.pictureSwitch.isTrue &&
                        homeController.phraseImage.value.isEmpty) {
                      DefaultSnackbar.show("Error", "Select phrase image");
                    }
                    // else if (homeController.soundSwitch.isTrue &&
                    //     homeController.phraseAudio.isEmpty) {
                    //   DefaultSnackbar.show("Error", "Record phrase audio");
                    // }
                    else {
                      if (widget.isUpdate == true) {
                        await homeController.updateSamplePhrase(true);
                        Get.back();
                        Get.back(result: true);
                        DefaultSnackbar.show('Success', 'Record Updated!');
                      } else {
                        await homeController.insertPhrase(true);
                        Get.back();
                        DefaultSnackbar.show('Success', 'Record Inserted!');
                      }
                    }

                    // Print other values
                  },
                  child: Text(
                    widget.isUpdate ? 'Update' : 'Submit',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
