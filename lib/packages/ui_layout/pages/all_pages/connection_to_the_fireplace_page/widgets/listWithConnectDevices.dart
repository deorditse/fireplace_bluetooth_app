import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../consts.dart';

listWithConnectDevices({required context}) {
  FireplaceConnectionGetXController _controllerApp = Get.find();
  return Container(
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
