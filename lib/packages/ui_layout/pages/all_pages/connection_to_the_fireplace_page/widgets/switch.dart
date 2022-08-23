import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Row mySwitchRow({required context}) {
  FireplaceConnectionGetXController _controllerApp = Get.find();

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        'assets/icons/free-icon-bluetooth-signal-indicator-60939 1 (Traced).png',
        fit: BoxFit.cover,
      ),
      Obx(
        () => Switch(
          value: _controllerApp.isSwitch.value,
          onChanged: (value) {
            _controllerApp.isSwitch.value = value;
          },
        ),
      ),
      Expanded(
        child: Text(
          'Сканирование\nдоступных устройств',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    ],
  );
}
