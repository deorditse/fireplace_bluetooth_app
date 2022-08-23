import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fire_ble_app/main.dart';
import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/news_page/news_page.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/drawer/end_drawer_app_bar.dart';

class MyBottomMenuSceleton extends StatefulWidget {
  static const id = '/';

  MyBottomMenuSceleton({Key? key}) : super(key: key);

  @override
  State<MyBottomMenuSceleton> createState() => _MyBottomMenuSceletonState();
}

class _MyBottomMenuSceletonState extends State<MyBottomMenuSceleton> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.to(() => NewsPage());
          },
          child: Text(
            'News',
            style: TextStyle(color: Colors.white),
          ), //const FaIcon(FontAwesomeIcons.newspaper, size: 15),
        ),
        actions: [
          MyEndDrawer.openEndDrawer(),
        ],
      ),
      endDrawer: MyEndDrawer(),
      body: Obx(() => listBodyPagesMenuBottomNavigation[
          controllerSetting.currentTabIndex.value]),
      bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
