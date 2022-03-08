import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/screens/settings/page/faq_screen.dart';
import 'package:ajapp/views/screens/settings/page/language_screen.dart';
import 'package:ajapp/views/screens/settings/page/suspend_delivery.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _toggled = false;
  bool _darkui = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
        centerPadding: 2,
        leadingIconRequired: false,
        textRequired: true,
        text: "Settings",
        cartIconRequired: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 36,
                color: KColor.greyLight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "GENERAL",
                    style: KTextStyle.bodyText2
                        .copyWith(color: KColor.primary, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notifications",
                      style: KTextStyle.bodyText2
                          .copyWith(color: KColor.primary, fontSize: 15),
                    ),
                    SizedBox(
                      child: FlutterSwitch(
                        width: 35.0,
                        height: 18.0,
                        toggleSize: 17.0,
                        value: _toggled,
                        borderRadius: 20.0,
                        padding: 1.5,
                        activeColor: KColor.primary,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            _toggled = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LanguageScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Language",
                        style: KTextStyle.bodyText2
                            .copyWith(color: KColor.primary, fontSize: 15),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: KColor.greyDark,
                        size: 26,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 18, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Data Use",
                      style: KTextStyle.bodyText2
                          .copyWith(color: KColor.primary, fontSize: 15),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: KColor.greyDark,
                      size: 26,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Ui",
                      style: KTextStyle.bodyText2
                          .copyWith(color: KColor.primary, fontSize: 15),
                    ),
                    SizedBox(
                      child: FlutterSwitch(
                        width: 35.0,
                        height: 18.0,
                        toggleSize: 17.0,
                        value: _darkui,
                        borderRadius: 20.0,
                        padding: 1.5,
                        activeColor: KColor.primary,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            _darkui = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 36,
                color: KColor.greyLight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Support",
                    style: KTextStyle.bodyText2
                        .copyWith(color: KColor.primary, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuspendDelivery()));
                      },
                      child: Text(
                        "Suspend Delivery",
                        style: KTextStyle.bodyText2
                            .copyWith(color: KColor.orange, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 20),
                    ),
                    Text(
                      "Report Missing Products",
                      style: KTextStyle.bodyText2
                          .copyWith(color: KColor.orange, fontSize: 15),
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 20),
                    ),
                    Text(
                      "Report a Bug",
                      style: KTextStyle.bodyText2
                          .copyWith(color: KColor.orange, fontSize: 15),
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 20),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MyHomePage()));
                      },
                      child: Text(
                        "Call Us",
                        style: KTextStyle.bodyText2
                            .copyWith(color: KColor.orange, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: KSize.getHeight(context, 20),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FAQScreen()));
                      },
                      child: Text(
                        "FAQ",
                        style: KTextStyle.bodyText2
                            .copyWith(color: KColor.orange, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
