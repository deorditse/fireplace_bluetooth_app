import 'dart:convert';
import 'dart:math';

import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/consts.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/GetX/blue_controller.dart';

import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/maint_connection_to_the_fireplace_page.dart';
import 'package:fire_ble_app/packages/ui_layout/test_page/widgerts/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SmartPrime1000Page extends StatefulWidget {
  static const String id = '/smartPrime1000Page';

  SmartPrime1000Page({Key? key, this.device}) : super(key: key);
  final BluetoothDevice? device;

  @override
  State<SmartPrime1000Page> createState() => _SmartPrime1000PageState();
}

class _SmartPrime1000PageState extends State<SmartPrime1000Page> {
  BluetoothCharacteristic? targetCharacteristic;

  writeData(String data) async {
    if (targetCharacteristic == null) return;

    List<int> bytes = utf8.encode(data);
    await targetCharacteristic!.write(bytes);
  }

  discoverServices() async {
    final targetDevice = widget.device;
    if (targetDevice == null) return;

    List<BluetoothService> services = await targetDevice.discoverServices();
    services.forEach(
      (service) {
        // if (service.uuid.toString() == SERVICE_UUID) {
        for (var characteristic in service.characteristics) {
          // if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
          targetCharacteristic = characteristic;
          writeData("Hi there, ESP32!!");
          setState(() {
            print("All Ready with ${targetDevice.name}");
          });
          // }
        }
        // }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    discoverServices();
  }

  @override
  Widget build(BuildContext context) {
    final device = widget.device;
    return Scaffold(
      body: Container(
        decoration: myDecorationBackground,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<BluetoothDeviceState>(
                    stream: device?.state,
                    initialData: BluetoothDeviceState.connected,
                    builder: (c, snapshot) {
                      snapshot.data == BluetoothDeviceState.disconnected
                          ? Get.back()
                          : null;
                      return ListTile(
                        leading: Icon(Icons.bluetooth_connected),
                        title: Text(
                            'Device is ${snapshot.data.toString().split('.')[1]}.'),
                        subtitle: Text('${device?.name}'),
                        trailing: StreamBuilder<bool>(
                          stream: device?.isDiscoveringServices,
                          initialData: false,
                          builder: (c, snapshot) => IndexedStack(
                            index: snapshot.data! ? 1 : 0,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () => device?.discoverServices(),
                              ),
                              IconButton(
                                icon: SizedBox(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.grey),
                                  ),
                                  width: 18.0,
                                  height: 18.0,
                                ),
                                onPressed: null,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
