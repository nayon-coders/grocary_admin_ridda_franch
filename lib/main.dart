import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minia_web_project/comman/language.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minia_web_project/data/binding/home.binding.dart';
import 'package:minia_web_project/firebase_options.dart';
import 'package:minia_web_project/routes/app_pages.dart';
import 'package:minia_web_project/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  ); // Initialize Firebase

  sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Minia",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      // home: DemoCK(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('de', 'CH'),
        Locale('it', 'CH'),
        Locale('ru', 'RU'),
      ],
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRoute.login,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
    );
  }
}
