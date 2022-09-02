import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/consts.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/app_bar/mySettingAppBar.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/navigation_bar/my_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SmartPrime1000Page extends StatefulWidget {
  static const String id = '/smartPrime1000Page';

  SmartPrime1000Page({
    Key? key,
  }) : super(key: key);

  @override
  State<SmartPrime1000Page> createState() => _SmartPrime1000PageState();
}

class _SmartPrime1000PageState extends State<SmartPrime1000Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecorationBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mySettingAppBar(context),
                Expanded(
                  child: Center(
                    child: Obx(() {
                      if (FireplaceConnectionGetXController
                          .instance.isBlocButton.value) {
                        return Text('блоктировка');
                      } else if (FireplaceConnectionGetXController
                          .instance.isSettingButton.value) {
                        return Text('setting');
                      } else {
                        return Text('основной контент');
                      }
                    }),
                  ),
                ),
                myNavigationBar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
