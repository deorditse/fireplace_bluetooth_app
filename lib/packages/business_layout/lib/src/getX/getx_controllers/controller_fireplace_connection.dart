import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class FireplaceConnectionGetXController extends GetxController {
  Rx<bool> isConnected = false.obs;
  Rx<bool> isSwitch = false.obs;

}
