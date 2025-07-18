import 'package:dentist/binding.dart';
import 'package:dentist/core/class/crud_with_dio.dart';
import 'package:dentist/core/localization/change_local.dart';
import 'package:dentist/core/localization/translated.dart';
import 'package:dentist/core/services/services.dart';
import 'package:dentist/core/shaerd/my_cash_helper.dart';
import 'package:dentist/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // سجل الخطأ أو أظهر رسالة للمستخدم
    print('Error initializing Firebase: $e');
  }


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await CashHelper.init();
  await DioHelper.init();


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
    themeMode: localeController.appThemeMode.value,

    theme: localeController.appTheme,
      darkTheme: ThemeData.dark(),

      getPages: routesGetX,

      initialBinding: MyBinding(),


    );
  }
}









