import 'dart:io';

import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/Utils/strings.dart';
import 'package:aacimple/app/modules/home/controllers/home_controller.dart';
import 'package:aacimple/app/modules/home/views/database_management/main_db_item_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDatabase extends StatefulWidget {
  const MainDatabase({
    super.key,
  });

  @override
  State<MainDatabase> createState() => _MainDatabaseState();
}

class _MainDatabaseState extends State<MainDatabase> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.startUpBgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder<List<Map<String, dynamic>>>(
              // Replace with your actual data fetching logic
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: EdgeInsets.only(top: Get.height * .3),
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: EdgeInsets.only(top: Get.height * .3),
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: Get.height * .3),
                    child: const Center(
                        child: Text(
                      'No record available',
                      style: TextStyle(color: Colors.white),
                    )),
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            homeController.selectedDbItem =
                                snapshot.data![index];
                            bool? result = await Get.to(MainDbItemDetail());
                            if (result == true) {
                              setState(() {});
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GridTile(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                ),
                                // Change this to your desired color
                                child:snapshot.data![index][Strings.picturePath].toString().contains("assets")?Image.asset(snapshot.data![index][Strings.picturePath]): Image.file(
                                  File(
                                    snapshot.data![index][Strings.picturePath],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    return homeController.getAllPhrases(true);
  }
}
