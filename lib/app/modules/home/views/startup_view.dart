import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/modules/home/views/activites/activites_selection_view.dart';
import 'package:aacimple/app/modules/home/views/database_management/database_management_view.dart';
import 'package:aacimple/app/modules/home/views/newmessage/newmessage_view.dart';
import 'package:aacimple/app/modules/home/views/settings/settings_view.dart';
import 'package:aacimple/app/modules/home/widgets/startup_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class StartUpView extends GetView<HomeController> {
  const StartUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.startUpBgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StartupButton(
                  svgPath: "assets/images/gear-solid.svg",
                  buttontText: 'SETTINGS',
                  isSvg: true,
                  onTap: () {
                    Get.to(const SettingsView());
                  },
                ),
                // StartupButton(
                //   svgPath: "assets/images/registered-regular.svg",
                //   buttontText: 'REGISTRATION-LICENCE',
                //   isSvg: true,
                //   onTap: () {
                //     DefaultSnackbar.show('Failure', 'Under Construction');
                //   },
                // ),
                StartupButton(
                  onTap: () {
                    Get.to(const NewMessageView(
                      isUpdate: false,
                    ));
                  },
                  svgPath: "assets/images/message-solid.svg",
                  buttontText: 'CREATE NEW MESSAGE',
                  isSvg: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StartupButton(
                  onTap: () {
                    Get.to(const DatabaseManagement());
                  },
                  svgPath: "assets/images/database-solid.svg",
                  buttontText: 'DATABASE MANAGEMENT',
                  isSvg: true,
                ),
                StartupButton(
                  onTap: () async {
                    Get.to(const ActivitesChangeView());
                    controller.allPhrases =
                        await controller.getAllPhrases(true);
                    controller.allPhrases.shuffle();
                  },
                  svgPath: "assets/images/chart-line-solid.svg",
                  buttontText: 'ACTIVITIES',
                  isSvg: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
