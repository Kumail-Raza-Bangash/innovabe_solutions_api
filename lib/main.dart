import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/getx_localization/languages.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      //language localization
      translations: Languages(),
      locale: const Locale('en', 'US'), // for urdu ('ur', 'PK')
      fallbackLocale: const Locale('en', 'US'),
      //

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoute(),
    );
  }
}
