import 'package:ajapp/services/navigation_service.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/global_components/k_text_field.dart';
import 'package:ajapp/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ajapp/views/styles/b_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Create Account',
                    style: KTextStyle.headline4.copyWith(color: KColor.primary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    'Fill the detail to create account',
                    style:
                        KTextStyle.bodyText2.copyWith(color: KColor.bodyText1),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        KTextField(
                          hintText: 'NAME',
                          hintColor: KColor.textFieldLabel,
                          textInputType: TextInputType.text,
                          controller: nameController,
                          requiredField: true,
                          topMargin: 4,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: KButton(
                    getWidth: KSize.getWidth(context, 295),
                    getHeight: KSize.getHeight(context, 58),
                    text: "Sign Up",
                    kbuttonTap: () {
                      Navigator.push(
                      context,
                      FadeRoute(page:const LoginScreen()));
                    },
                    txtcolor: KColor.white,
                    containerColor: KColor.primary,
                    borderColor: KColor.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
