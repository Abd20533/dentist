import 'package:dentist/binding.dart';
import 'package:dentist/core/localization/change_local.dart';
import 'package:dentist/core/localization/translated.dart';
import 'package:dentist/core/services/services.dart';
import 'package:dentist/core/shaerd/my_cash_helper.dart';
import 'package:dentist/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CashHelper.init();

  ///initializedServices
  await initializedServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
  LocaleController localeController = Get.put(LocaleController());

  return GetMaterialApp(
      locale: localeController.language,
      translations: MyTranslated(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: localeController.appThemeMode,
      theme: localeController.appTheme,
      darkTheme: ThemeData.dark(),
      ///routes ready for GetX
      getPages: routesGetX,

      /// for controller to delete
      initialBinding: MyBinding()

      // home: const Splash()
    );
  }
}









