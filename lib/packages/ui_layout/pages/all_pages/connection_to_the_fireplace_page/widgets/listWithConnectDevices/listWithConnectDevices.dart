import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/GetX/blue_controller.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/widgets/listWithConnectDevices/scanBleSwitchFalse.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/widgets/listWithConnectDevices/widgets.dart';
import 'package:fire_ble_app/packages/ui_layout/test_page/test_ble_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

import '../../../../../consts.dart';

class ListWithConnectDevices extends StatelessWidget {
  static const String id = '/listDevices';

  BleGetXController _controllerBlue = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controllerBlue.isSwitch.value
          ? /*FindDevicesScreenTest()*/ FindDevicesScreen()
          : scanBleSwitchFalse(context: context),
    );
  }
}

class FindDevicesScreen extends StatefulWidget {
  @override
  State<FindDevicesScreen> createState() => _FindDevicesScreenState();
}

class _FindDevicesScreenState extends State<FindDevicesScreen> {
  bool barrier = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RefreshIndicator(
        onRefresh: () => FlutterBlue.instance.startScan(
          timeout: Duration(seconds: 2),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<List<ScanResult>>(
                  stream: FlutterBlue.instance.scanResults,
                  initialData: [],
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...snapshot.data!.map((r) {
                          if (r.device.name.length > 0) {
                            barrier = false;
                            return ScanResultTile(result: r);
                          } else {
                            return Container();
                          }
                        }).toList(),
                        if (barrier)
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Container(
                              child: CircularProgressIndicator(
                                color: myColorActivity,
                                strokeWidth: 2,
                              ),
                              // height: MediaQuery.of(context).size.width,
                              // width: MediaQuery.of(context).size.width,
                            ),
                          ),
                      ],
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
