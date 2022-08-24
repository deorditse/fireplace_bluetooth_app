// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:fire_ble_app/packages/ui_layout/consts.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/maint_connection_to_the_fireplace_page.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/smartPrime_1000/main_smartPrime_1000.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result}) : super(key: key);

  final ScanResult result;

  //
  // Widget _buildTitle(BuildContext context) {
  //   if (result.device.name.length > 0) {
  //     return Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           result.device.name,
  //           overflow: TextOverflow.ellipsis,
  //           style: Theme.of(context).textTheme.headline2,
  //         ),
  //         // FittedBox(
  //         //   child: Text(
  //         //     result.device.id.toString(),
  //         //     style: Theme.of(context).textTheme.headline3,
  //         //   ),
  //         // ),
  //       ],
  //     );
  //   } else {
  //     return Text(
  //       result.device.id.toString(),
  //       overflow: TextOverflow.ellipsis,
  //       style: Theme.of(context).textTheme.headline2,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Text(
                result.device.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: StreamBuilder<BluetoothDeviceState>(
              stream: result.device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) {
                VoidCallback? onPressed;
                Text text;
                Icon? iconState;
                switch (snapshot.data) {
                  case BluetoothDeviceState.connected:
                    onPressed = () {
                      result.device.disconnect();
                    };
                    iconState = const Icon(
                      Icons.check,
                    );
                    text = Text(
                      'подключено',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: myColorActivity,
                          ),
                    );

                    // Get.to();

                    break;
                  case BluetoothDeviceState.disconnected:
                    onPressed = () async {
                      await result.device.connect();
                      print('connect ${result.device.id}');

                      ///сделать проверку по имени и только после этого переводить на страницу управления
                      Get.offAll(
                        () => SmartPrime1000Page(
                          device: result.device,
                        ),
                      );
                    };
                    iconState = null;
                    text = Text(
                      'подключить',
                      style: Theme.of(context).textTheme.headline2!,
                    );

                    break;
                  case BluetoothDeviceState.connecting:
                    iconState = const Icon(
                      Icons.bluetooth_audio_outlined,
                    );
                    onPressed = null;
                    text = Text(
                      'подключение',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: myColorActivity,
                          ),
                    );
                    break;
                  default:
                    onPressed = null;
                    text = Text(
                        snapshot.data.toString().substring(21).toUpperCase());
                    break;
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: iconState,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        child: ElevatedButton(
                          onPressed: onPressed,
                          child: text,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
