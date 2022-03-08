import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/services/navigation_service.dart';
import 'package:ajapp/views/screens/auth/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:ajapp/views/styles/b_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData()async{
    await Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(
                context,
                FadeRoute(page:const WelcomePage()),
              ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: KColor.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetPath.appLogo),
                const SizedBox(
                  height: 4,
                ),
                Image.asset(AssetPath.style),
              ],
            ),
          ),
        ));
  }
}
