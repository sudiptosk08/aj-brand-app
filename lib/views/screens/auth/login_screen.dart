import 'package:ajapp/services/navigation_service.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/global_components/k_text_field.dart';
import 'package:ajapp/views/screens/auth/forgot_password.dart';
import 'package:ajapp/views/screens/bottom_navbar/bottom_navigation_page.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      // appBar: KAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 14, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: KColor.black,
                        size: 30,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          null;
                        },
                        child: Text(
                          "Need Help?",
                          style: KTextStyle.bodyText2
                              .copyWith(color: KColor.bodyText1),
                        )),
                  ],
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Sign In',
                    style: KTextStyle.headline4.copyWith(color: KColor.primary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    'Fill the detail to sign in account',
                    style:
                        KTextStyle.bodyText2.copyWith(color: KColor.bodyText1),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        KTextField(
                          hintText: 'EMAIL',
                          hintColor: KColor.textFieldLabel,
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
                          requiredField: true,
                          topMargin: 4,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        KTextField(
                          hintText: "PASSWORD",
                          hintColor: KColor.textFieldLabel,
                          textInputType: TextInputType.text,
                          controller: passwordController,
                          requiredField: true,
                          topMargin: 4,
                          isPasswordField: true,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, FadeRoute(page: const ForgotPasswordScreen()));
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot Password?",
                        style: KTextStyle.bodyText2.copyWith(
                            color: KColor.primary, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: KButton(
                    getWidth: KSize.getWidth(context, 295),
                    getHeight: KSize.getHeight(context, 58),
                    text: "Sign In",
                    kbuttonTap: () {
                      Navigator.pushReplacement(
                          context,
                          FadeRoute(
                              page: const BottomNavigationScreen(value: true)));
                    },
                    txtcolor: KColor.white,
                    containerColor: KColor.primary,
                    borderColor: KColor.primary,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
