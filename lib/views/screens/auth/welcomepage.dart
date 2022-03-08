import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/services/navigation_service.dart';
import 'package:ajapp/views/screens/auth/signup_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome To",
            textAlign: TextAlign.center,
            style: KTextStyle.headline3.copyWith(color: KColor.black),
          ),
          SizedBox(
            height: KSize.getHeight(context, 20),
          ),
          Image.asset(AssetPath.appLogo),
          SizedBox(
            height: KSize.getHeight(context, 50),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, FadeRoute(page: const SignUpScreen()));
            },
            child: Center(
              child: Container(
                width: KSize.getWidth(context, 292),
                height: KSize.getHeight(context, 62),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: KColor.grey,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        image: const DecorationImage(
                          image: AssetImage(AssetPath.apple),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text("Sign in with Apple",
                        style: KTextStyle.headline6
                            .copyWith(color: KColor.primary))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: KSize.getHeight(context, 20),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context, FadeRoute(page: const SignUpScreen()));
            },
            child: Center(
              child: Container(
                width: KSize.getWidth(context, 292),
                height: KSize.getHeight(context, 62),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: KColor.grey.withOpacity(0.5),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        image: const DecorationImage(
                          image: AssetImage(AssetPath.google),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text("Sign in with Google",
                        style:
                            KTextStyle.headline6.copyWith(color: KColor.blue))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: KSize.getHeight(context, 50),
          ),
          Text(
            "or",
            style: KTextStyle.bodyText1.copyWith(color: KColor.bodyText1),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, FadeRoute(page: const SignUpScreen()));
            },
            child: Text(
              "Create a new account",
              style: KTextStyle.subtitle2.copyWith(color: KColor.primary),
            ),
          )
        ],
      ),
    );
  }
}
