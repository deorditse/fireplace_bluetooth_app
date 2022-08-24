import 'dart:math';

import 'package:fire_ble_app/packages/ui_layout/consts.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/GetX/blue_binding.dart';
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
  List<int> _getRandomBytes() {
    final math = Random();
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
            service: s,
            characteristicTiles: s.characteristics
                .map(
                  (c) => CharacteristicTile(
                    characteristic: c,
                    onReadPressed: () => c.read(),
                    onWritePressed: () async {
                      await c.write(_getRandomBytes(), withoutResponse: true);
                      await c.read();
                    },
                    onNotificationPressed: () async {
                      await c.setNotifyValue(!c.isNotifying);
                      await c.read();
                    },
                    descriptorTiles: c.descriptors
                        .map(
                          (d) => DescriptorTile(
                            descriptor: d,
                            onReadPressed: () => d.read(),
                            onWritePressed: () => d.write(_getRandomBytes()),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList() as List<Widget>;
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
                      if (snapshot.data == BluetoothDeviceState.disconnected) {
                        BleGetXController.instance.isSwitch.value = true;
                        Get.to(
                          () => ConnectionToTheFireplacePage(),
                          binding: BleBinding(),
                        );
                      }
                      return ListTile(
                        leading:
                            (snapshot.data == BluetoothDeviceState.connected)
                                ? Icon(Icons.bluetooth_connected)
                                : Icon(Icons.bluetooth_disabled),
                        title: Text(
                            'Device is ${snapshot.data.toString().split('.')[1]}.'),
                        subtitle: Text('${device?.id}'),
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
                StreamBuilder<int>(
                  stream: device?.mtu,
                  initialData: 0,
                  builder: (c, snapshot) => ListTile(
                    title: Text('MTU Size'),
                    subtitle: Text('${snapshot.data} bytes'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => device?.requestMtu(223),
                    ),
                  ),
                ),
                StreamBuilder<List<BluetoothService>>(
                  stream: device?.services,
                  initialData: [],
                  builder: (c, snapshot) {
                    return Column(
                      children: _buildServiceTiles(snapshot.data!),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
