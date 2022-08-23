import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/widgets/listWithConnectDevices.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/app_bar.dart';
import 'package:fire_ble_app/packages/ui_layout/widgets/setting_end_drawer/end_drawer_app_bar.dart';
import 'package:flutter/material.dart';

class ConnectionToTheFireplacePage extends StatefulWidget {
  static const String id = '/';

  ConnectionToTheFireplacePage({Key? key}) : super(key: key);

  @override
  State<ConnectionToTheFireplacePage> createState() =>
      _ConnectionToTheFireplacePageState();
}

class _ConnectionToTheFireplacePageState
    extends State<ConnectionToTheFireplacePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          stops: [0.0, 0.4, 1.0],
          colors: [
            Color.fromRGBO(78, 77, 77, 1),
            Color.fromRGBO(43, 42, 42, 1),
            Color.fromRGBO(9, 7, 7, 1),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer: MyEndDrawer(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/icons/header.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Подключение к камину:',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      '1. Установите камин согласно инструкции пользователя.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Подключение к камину',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3. Включите сканирование доступных устройств.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '4. Выберите ваше устройство.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/icons/free-icon-bluetooth-signal-indicator-60939 1 (Traced).png',
                      fit: BoxFit.cover,
                    ),
                    Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Expanded(
                      child: Text(
                        'Сканирование\nдоступных устройств',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                listWithConnectDevices(context: context),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/icons/premium-icon-internet-3710036 1 (Traced).png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'abc-fireplace.com',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
