import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_text_field.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 8,
        leadingIconRequired: true,
        leadingicon: AssetPath.arrow,
        leadiconpress: () {
          Navigator.pop(context);
        },
        cartIconRequired: false,
        text: "Profile",
        textRequired: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Stack(children: [
                Container(
                  width: KSize.getWidth(context, 120),
                  height: KSize.getHeight(context, 110),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage(AssetPath.profile))),
                ),
                Positioned(
                    bottom: 7,
                    right: 2,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(color: KColor.grey.withOpacity(0.3)),
                        color: KColor.white,
                      ),
                      child: const Icon(
                        Icons.mode_edit_outline_outlined,
                        size: 23,
                      ),
                    ))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Name",
                                style: KTextStyle.bodyText1.copyWith(
                                    fontSize: 14, color: KColor.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: KTextField(
                                  hintText: 'NAME',
                                  hintColor: KColor.textFieldLabel,
                                  textInputType: TextInputType.text,

                                  //controller: emailController,
                                  requiredField: true,
                                  topMargin: 6,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: KTextStyle.bodyText1.copyWith(
                                    fontSize: 14, color: KColor.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: KTextField(
                                  hintText: 'EMAIL',
                                  hintColor: KColor.textFieldLabel,
                                  textInputType: TextInputType.text,
                                  //controller: emailController,
                                  requiredField: true,
                                  topMargin: 6,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Number",
                                style: KTextStyle.bodyText1.copyWith(
                                    fontSize: 14, color: KColor.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: KTextField(
                                  hintText: 'NUMBER',
                                  hintColor: KColor.textFieldLabel,
                                  textInputType: TextInputType.text,
                                  //controller: emailController,
                                  requiredField: true,
                                  topMargin: 6,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address",
                                style: KTextStyle.bodyText1.copyWith(
                                    fontSize: 14, color: KColor.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: KTextField(
                                  hintText: 'ADDRESS',
                                  hintColor: KColor.textFieldLabel,
                                  textInputType: TextInputType.text,
                                  //controller: emailController,
                                  requiredField: true,
                                  topMargin: 6,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
