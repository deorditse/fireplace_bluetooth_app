import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';

class TabItem {
  String title;
  FaIcon icon;

  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: 'Главная', icon: FaIcon(FontAwesomeIcons.home)),
  TabItem(title: 'Тренировки', icon: FaIcon(FontAwesomeIcons.braille)),
  TabItem(title: 'Чат', icon: FaIcon(FontAwesomeIcons.comments)),
  TabItem(title: 'Профиль', icon: FaIcon(FontAwesomeIcons.user)),
];

class MyBottomNavigatorBar extends StatelessWidget {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        iconSize: 15,
        elevation: 10,
        fixedColor: Theme.of(context).primaryColor,
        // unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(icon: item.icon, label: item.title)
        ],
        onTap: (index) {
          // tabController.index = index;
          controllerSetting.currentTabIndex.value = index;
        },
        currentIndex: controllerSetting.currentTabIndex.value,
      ),
    );
  }
}
