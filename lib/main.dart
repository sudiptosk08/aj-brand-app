
import 'package:ajapp/services/navigation_service.dart';
import 'package:ajapp/views/screens/startup/splash_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: KColor.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      title: 'Saxon Market',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        pageTransitionsTheme:const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primaryColor: KColor.primary,
        textTheme: Typography.material2018().black,
        backgroundColor: KColor.white,
        scaffoldBackgroundColor: KColor.white,
        fontFamily: GoogleFonts.montserrat().toString(),
      ),
      home: const SplashScreen(),
    );
  }
}
