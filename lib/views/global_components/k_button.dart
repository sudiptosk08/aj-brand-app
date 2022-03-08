import 'package:ajapp/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:ajapp/views/styles/b_style.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    this.text,
    this.txtcolor,
    this.containerColor,
    this.borderColor,
    this.kbuttonTap,
    this.getHeight,
    this.getWidth,
  }) : super(key: key);
  final String? text;
  final Color? txtcolor;
  final Color? containerColor;
  final Color? borderColor;
  final GestureTapCallback? kbuttonTap;
  final double? getWidth;
  final double? getHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: kbuttonTap,
      child: Container(
        alignment: Alignment.center,
        width: getWidth,
        height: getHeight,
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.7,
              color: borderColor!,
            ),
            borderRadius: BorderRadius.circular(20),
            color: containerColor),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(text!,
              textAlign: TextAlign.center,
              style: KTextStyle.bodyText1.copyWith(
                  color: txtcolor, fontWeight: FontWeight.w500, fontSize: 18)),
        ]),
      ),
    );
  }
}
