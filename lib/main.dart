import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_ble_app/packages/business_layout/lib/business_layout.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/all_pages/news_page/news_page.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_chat_page/body_chat_page.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/body_home_page.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_profile_page/body_profile_page.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/body_sports_page.dart';
import 'package:fire_ble_app/packages/ui_layout/pages/bottom_navigation_page/main_bottom_menu_sceleton.dart';
import 'package:fire_ble_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/dark_custom_theme_material.dart';
import 'package:fire_ble_app/packages/ui_layout/style_app/theme_app/custom_theme/material_theme/light_custom_theme_material.dart';

Future<void> main() async {
  // await Hive.initFlutter();
  // Services.sharedPrefs = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyGetApp());
}

List<Widget> listBodyPagesMenuBottomNavigation = [
  BodyHomePage(),
  BodySportsPage(),
  BodyChatPage(),
  BodyProfilePage(),
];

class MyGetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BasicsExampleBinding(),
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: ThemeMode.system,
      initialRoute: MyBottomMenuSceleton.id,
      getPages: [
        GetPage(
          name: MyBottomMenuSceleton.id,
          page: () => MyBottomMenuSceleton(),
          binding: BasicsExampleBinding(),
        ),
        GetPage(
          name: NewsPage.id,
          page: () => NewsPage(),
          binding: BasicsExampleBinding(),
        ),
      ],
    );
  }
}
