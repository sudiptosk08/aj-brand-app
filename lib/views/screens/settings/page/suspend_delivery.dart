import 'dart:io';
import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class SuspendDelivery extends StatefulWidget {
  const SuspendDelivery({Key? key}) : super(key: key);

  @override
  _SuspendDeliveryState createState() => _SuspendDeliveryState();
}

class _SuspendDeliveryState extends State<SuspendDelivery> {
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 2,
        leadingIconRequired: true,
        leadiconpress: () {
          Navigator.pop(context);
        },
        leadingicon: AssetPath.arrow,
        textRequired: true,
        text: "Suspend Delivery",
        cartIconRequired: false,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                "Why your delivery suspended?",
                style: KTextStyle.headline5.copyWith(
                    fontSize: 24, color: KColor.primary, letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                "Write down a note with your attachment",
                style: KTextStyle.caption.copyWith(
                  color: KColor.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 5),
              child: Container(
                width: double.infinity,
                height: KSize.getHeight(context, 160),
                decoration: BoxDecoration(
                  color: KColor.grey100,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: TextFormField(
                  style: KTextStyle.bodyText1,
                  //controller: description,
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: KSize.getWidth(context, 10),
                      vertical: KSize.getHeight(context, 4),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Write here',
                    hintStyle:
                        KTextStyle.bodyText2.copyWith(color: KColor.bodyText1),
                  ),
                ),
              ),
            ),

            //if (fileImage != null) buildFileImage(),
            //if (memoryImage != null) buildMemoryImage(),
            Padding(
                padding: const EdgeInsets.all(14),
                child: SizedBox(
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      width: 327,
                      height: 100,
                      decoration: BoxDecoration(
                        color: KColor.grey100,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Attatch File(Optional) ",
                              textAlign: TextAlign.center,
                              style: KTextStyle.bodyText2
                                  .copyWith(color: KColor.bodyText1),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Icon(
                              Icons.insert_drive_file,
                              color: KColor.greyDark,
                              size: 30,
                            ),
                          ]),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: KButton(
                getWidth: KSize.getWidth(context, 275),
                getHeight: KSize.getHeight(context, 58),
                borderColor: KColor.primary,
                containerColor: KColor.primary,
                text: "Send",
                txtcolor: KColor.white,
                kbuttonTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
