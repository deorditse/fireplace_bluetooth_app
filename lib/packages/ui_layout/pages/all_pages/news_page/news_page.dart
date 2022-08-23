import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/drawer/end_drawer_app_bar.dart';

class NewsPage extends StatefulWidget {
  static const id = '/news_page/';

  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: MyLeftDrawer.openLeftDrawer(),
        title: const Text('Новости'),
        // actions: [
        //   MyEndDrawer.openEndDrawer(),
        // ],
      ),
      // endDrawer: MyEndDrawer(),
      body: Center(
          child: Container(
        child: Text('NewsPage'),
      )),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
