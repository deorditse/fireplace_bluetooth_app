import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/GetX/blue_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

import '../../../../../consts.dart';

BleGetXController _controllerBlue = Get.find();

class ListWithConnectDevices extends StatefulWidget {
  static const String id = '/listDevices';

  @override
  State<ListWithConnectDevices> createState() => _ListWithConnectDevicesState();
}

class _ListWithConnectDevicesState extends State<ListWithConnectDevices> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controllerBlue.isSwitch.value
          ? FindDevicesScreen()
          : _scanBluetooth(context: context),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
// Color(0xBDBDBD),
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            RefreshIndicator(
              onRefresh: () => FlutterBlue.instance.startScan(
                timeout: Duration(seconds: 2),
              ),
              child: StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(Duration(
                        seconds: 2)) //проверка с периодичностью 2 seconds
                    .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map(
                        (d) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              d.name,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            StreamBuilder<BluetoothDeviceState>(
                              stream: d.state,
                              initialData: BluetoothDeviceState.disconnected,
                              builder: (c, snapshot) {
                                if (snapshot.data ==
                                    BluetoothDeviceState.connected) {
                                  return ElevatedButton(
                                      child: Row(
                                        children: [
                                          Icon(Icons.check),
                                          Text(
                                            'подключено',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    color: myColorActivity),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {});
                                }
                                return Text(snapshot.data.toString());
                              },
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_decorationList() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.white,
// Color(0xBDBDBD),
      width: 1,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

listWithConnectDevices({required context}) {
  FireplaceConnectionGetXController _controllerApp = Get.find();
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: _decorationList(),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Smart Fire A7 1000',
                  style: Theme.of(context).textTheme.headline2,
                ),
                if (_controllerApp.isConnected.value) Icon(Icons.check),
                GestureDetector(
                  onTap: () {
                    _controllerApp.isConnected.value =
                        !_controllerApp.isConnected.value;
                  },
                  child: _controllerApp.isConnected.value
                      ? Text(
                          'подключено',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: myColorActivity),
                        )
                      : Text(
                          'подключить',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Smart Fire A7 1000',
                style: Theme.of(context).textTheme.headline2,
              ),
              if (_controllerApp.isConnected.value) Icon(Icons.check),
              GestureDetector(
                onTap: () {
                  _controllerApp.isConnected.value =
                      !_controllerApp.isConnected.value;
                },
                child: _controllerApp.isConnected.value
                    ? Text(
                        'подключено',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: myColorActivity),
                      )
                    : Text(
                        'подключить',
                        style: Theme.of(context).textTheme.headline2,
                      ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Smart Fire A7 1000',
                style: Theme.of(context).textTheme.headline2,
              ),
              Icon(Icons.check),
              Text(
                'подключить',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Smart Fire A7 1000',
                style: Theme.of(context).textTheme.headline2,
              ),
              Icon(Icons.check),
              Text(
                'подключить',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

_scanBluetooth({required context}) {
  return Container(
    decoration: _decorationList(),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.toggle_on_outlined,
              size: MediaQuery.of(context).size.width / 4,
              color: Colors.white54,
            ),
            Text(
              'Активируйте сканирование устройств',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    ),
  );
}
