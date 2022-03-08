import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  final String txt;
  final String? sign;
  final IconData? iconData;
  final Color? color;
  final GestureTapCallback ontap;
  const DrawerItem(
      {Key? key,
      required this.txt,
      this.iconData,
      this.sign,
      this.color,
      required this.ontap})
      : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: InkWell(
          onTap: widget.ontap,
          child: Text(
            widget.txt,
            style: KTextStyle.bodyText1.copyWith(
              color: widget.color,
              fontSize: 18,
            ),
          ),
        ),
      ),
      Positioned(
        top: -4,
        right: KSize.getWidth(context, 120),
        child: Text(
          widget.sign.toString(),
          style: KTextStyle.bodyText1.copyWith(
            color: widget.color,
            fontSize: 26,
          ),
        ),
      ),
    ]);
  }
}
