import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/bluetooth_off_screen.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/maint_connection_to_the_fireplace_page.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BleGetXController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  // late Rx<BluetoothState> _streamBlueState;
  Rx<bool> isSwitch = false.obs;

  Stream<BluetoothState> get streamBlueState => flutterBlue.state;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   _streamBlueState = Rx<BluetoothState>(BluetoothState.off);
  //   _streamBlueState.bindStream(flutterBlue.state);
  //   ever(_streamBlueState, _initialScreen);
  // }
  //
  // _initialScreen(BluetoothState? streamBlueState) {
  //   if (streamBlueState == BluetoothState.on) {
  //     // if the user is not found then the user is navigated to the Register Screen
  //     Get.offAll(() => ConnectionToTheFireplacePage());
  //     Get.snackbar('title', 'message');
  //   } else {
  //     // if the user exists and logged in the the user is navigated to the Home Screen
  //     //сюда можно передвать данные пользователя из базы
  //     Get.offAll(() => const BluetoothOffScreen());
  //   }
  // }
}
