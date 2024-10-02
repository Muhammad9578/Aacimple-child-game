import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:aacimple/app/modules/home/views/activites/four_activity_screen.dart';
import 'package:aacimple/app/modules/home/views/activites/one_activity_view.dart';
import 'package:aacimple/app/modules/home/views/activites/six_activity_screen.dart';
import 'package:aacimple/app/modules/home/views/activites/six_row_activity_screen.dart';
import 'package:aacimple/app/modules/home/views/activites/three_activity_view.dart';
import 'package:aacimple/app/modules/home/views/activites/twelve_activity_screen.dart';
import 'package:aacimple/app/modules/home/views/activites/two_activity_view.dart';
import 'package:aacimple/app/modules/home/widgets/activity_selection_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ActivitesChangeView extends GetView<HomeController> {
  const ActivitesChangeView({super.key});

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
        title: const Text(
          "Activites",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: ColorHelper.startUpBgColor,
      body: Container(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Column(
                  
                  children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActivitySelectionButton(
                        buttonText: '1',
                        onTap: () {
                          controller.selectedIndex.value = 0;
                          Get.to(const OneActivityView());
                        },
                      ),
                      ActivitySelectionButton(
                        buttonText: '2',
                        onTap: () {
                          controller.selectedIndex.value = 0;
                          Get.to(const TwoActivityView());
                        },
                      ),
                      ActivitySelectionButton(
                        buttonText: '3',
                        onTap: () {
                          controller.selectedIndex.value = 0;
                          Get.to(const ThreeActivityView());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActivitySelectionButton(
                        buttonText: '4',
                        onTap: () {
                          controller.selectedIndex.value = 0;
                          Get.to(const FourActivityView());
                        },
                      ),
                      ActivitySelectionButton(
                        buttonText: '6',
                        onTap: () {
                          controller.selectedIndex.value = 0;
                          Get.to(const SixActivityView());
                        },
                      ),
                      ActivitySelectionButton(
                        buttonText: '6B',
                        onTap: () {
                          controller.selectedIndex.value = 0;
                          Get.to(const SixRowActivityView());
                        },
                      ),
                    ],
                  ),
                 ],),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActivitySelectionButton(
                    buttonText: '12',
                    onTap: () {
                      controller.selectedIndex.value = 0;
                      Get.to(const TwelveActivityView());
                    },
                  ),
                ],
              ),
               ],
             ),
              const SizedBox(
                height: 20,
              ),
             
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
