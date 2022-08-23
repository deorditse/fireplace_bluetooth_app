import 'package:fire_ble_app/packages/business_layout/lib/src/getX/bindings.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/connection_to_the_fireplace_page/maint_connection_to_the_fireplace_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'package:fire_ble_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/light_custom_theme_material.dart';

Future<void> main() async {
  // await Hive.initFlutter();
  // Services.sharedPrefs = await SharedPreferences.getInstance();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyGetApp());
}

class MyGetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BasicsExampleBinding(),
      //инициируем страницу для проверки подключения блютуза и на все настройки
      // theme: themeLight,
      theme: themeDark,
      // darkTheme: themeDark,
      // themeMode: ThemeMode.system,
      initialRoute: ConnectionToTheFireplacePage.id,
      getPages: [
        GetPage(
          name: ConnectionToTheFireplacePage.id,
          page: () => ConnectionToTheFireplacePage(),
          binding: BasicsExampleBinding(),
        ),
        // GetPage(
        //   name: NewsPage.id,
        //   page: () => NewsPage(),
        //   binding: BasicsExampleBinding(),
        // ),
      ],
    );
  }
}
