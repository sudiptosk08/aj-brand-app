import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/global_components/k_text_field.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';


class ForgotPasswordScreen extends StatefulWidget {
  final String? email, phone;
  const ForgotPasswordScreen({Key? key, this.email, this.phone}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();

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
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Forget Password!',
                    style: KTextStyle.headline4.copyWith(color: KColor.primary),
                  ),
                ),
                 const SizedBox(height: 10),
                 Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Enter your email we will send you code on your email',
                    style:
                        KTextStyle.bodyText2.copyWith(color: KColor.bodyText1),
                  ),
                ),
                const SizedBox(height: 60),
               
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KTextField(
                          
                          hintText: "EMAIL",
                          hintColor: KColor.textFieldLabel,
                          textInputType: TextInputType.emailAddress,
                          controller: codeController,
                          requiredField: true,
                          topMargin: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
               
                const SizedBox(height: 60),
                Center(
                  child: KButton(
                        getHeight: KSize.getHeight(context, 58),
                        getWidth: KSize.getWidth(context, 295),
                        text: "Continue",
                        containerColor: KColor.primary,
                        borderColor: KColor.primary,
                        txtcolor: KColor.white,
                        kbuttonTap: () {
                   
                        }
                  ),
                ),
              
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
