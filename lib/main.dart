import 'dart:io';

import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:aacimple/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

Directory? appDocDir;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  appDocDir = await getApplicationDocumentsDirectory();
  HomeController homeController = Get.put(HomeController(), permanent: true);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AACIMPLE",
      initialRoute: AppPages.INITIAL,
      // theme: ThemeData(
      //   fontFamily: "",
      // ),
      getPages: AppPages.routes,
    ),
  );
}
