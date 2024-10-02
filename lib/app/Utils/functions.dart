import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HelperFunctions {
  HomeController homeController = Get.find();
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      homeController.phraseImage.value = pickedFile.path;
    }
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      homeController.phraseImage.value = pickedFile.path;
    }
  }

  //Show options to get image from camera or gallery
  Future showOptions() async {
    showCupertinoModalPopup(
      context: navigator!.context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Get.back();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Get.back(); // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  Future<void> openColorPicker(bool isFont, bool fromSettings) async {
    HomeController homeController = Get.find();
    Color? color;
    if (isFont) {
      if (fromSettings) {
        color = homeController.messageBoxFontColor.value;
      } else {
        color = homeController.selectedFontColor.value;
      }
    } else {
      if (fromSettings) {
        color = homeController.messageBoxBackgroundColor.value;
      } else {
        color = homeController.selectedBackgroundColor.value;
      }
    }

    bool pickedColor = await ColorPicker(
      color: color,
      onColorChanged: (Color newColor) {
        print(newColor);

        if (isFont) {
          if (fromSettings) {
            homeController.messageBoxFontColor.value = newColor;
          } else {
            homeController.selectedFontColor.value = newColor;
          }
        } else {
          if (fromSettings) {
            homeController.messageBoxBackgroundColor.value = newColor;
          } else {
            homeController.selectedBackgroundColor.value = newColor;
          }
        }
      },
      width: 40,
      height: 40,
      borderRadius: 20,
      spacing: 10,
      runSpacing: 10,
      heading: const Text('Pick a color'),
      subheading: const Text('Select color shade'),
      wheelDiameter: 200,
      wheelWidth: 20,
    ).showPickerDialog(navigator!.context);
  }
}
