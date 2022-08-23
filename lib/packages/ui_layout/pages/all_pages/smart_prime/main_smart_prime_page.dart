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
        body: CustomScrollView(slivers: [
          // mySliverMainAppBar(context),
          // Image.asset('assets/icons/header.png'),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Text('data'),

              // Expanded(
              //   child: Image.asset('assets/icons/header.png'),
              // ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text('Подключение к камину'),
          Column(
            children: [
              Text('1. Установите камин согласно инструкции пользователя.'),
              Text('2. Подключение к камину'),
              Text('3. Включите сканирование доступных устройств.'),
              Text('4. Выберите ваше устройство.'),
            ],
          ),
          Row(
            children: [
              Icon(Icons.bluetooth_audio),
              Switch(value: false, onChanged: (value) {}),
            ],
          ),
        ]),
      ),
    );
  }
}
