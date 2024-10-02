import 'package:aacimple/app/Utils/color_helper.dart';
import 'package:aacimple/app/modules/home/views/database_management/main_database.dart';
import 'package:aacimple/app/modules/home/views/database_management/old_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseManagement extends StatefulWidget {
  const DatabaseManagement({super.key});

  @override
  State<DatabaseManagement> createState() => _DatabaseManagementState();
}

class _DatabaseManagementState extends State<DatabaseManagement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.startUpBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight - 15,
              child: TabBar(
                indicatorColor: Colors.white,
                controller: _tabController,
                tabs: const [
                  Tab(
                      child: Text(
                    'Main Database',
                    style: TextStyle(color: Colors.white),
                  )),
                  Tab(
                      child: Text(
                    'Old Database',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  MainDatabase(),
                  OldDatabase(),
                ],
              ),
            ),
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
