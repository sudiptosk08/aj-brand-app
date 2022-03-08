import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShoppingCard extends StatefulWidget {
  Color? selectedColor;
  String? titleText;
  String? colorText;
  String? sizeText;
  String? price;
  int? productcount;
  String? imagePath;
  ShoppingCard({
    Key? key,
    this.selectedColor,
    this.titleText,
    this.colorText,
    this.sizeText,
    this.price,
    this.productcount,
    this.imagePath,
  }) : super(key: key);

  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  // ignore: prefer_typing_uninitialized_variables
  var count;
  @override
  void initState() {
    super.initState();
    count = widget.productcount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: KSize.getWidth(context, 345),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: KSize.getWidth(context, 100),
              width: KSize.getHeight(context, 110),
              decoration: BoxDecoration(
                  color: const Color(0xFF5F5D70),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(widget.imagePath!), fit: BoxFit.fill)),
            ),
            SizedBox(
              width: KSize.getWidth(context, 200),
              height: KSize.getHeight(context, 117),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.titleText!,
                    overflow: TextOverflow.ellipsis,
                    style: KTextStyle.subtitle2.copyWith(
                        color: KColor.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text.rich(TextSpan(
                          text: "Size : ",
                          style: KTextStyle.bodyText1.copyWith(
                              fontSize: 14, color: KColor.accentColor),
                          children: [
                            TextSpan(
                                text: widget.sizeText,
                                style: KTextStyle.bodyText1.copyWith(
                                    fontSize: 14, color: KColor.primary))
                          ])),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("Color : ",
                          style: KTextStyle.bodyText1
                              .copyWith(fontSize: 14, color: KColor.bodyText1)),
                      Container(
                        alignment: Alignment.center,
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: widget.selectedColor,
                            border:
                                Border.all(color: KColor.primary, width: 1)),
                      ),
                    ],
                  ),
                  Text(widget.price!,
                      style: KTextStyle.bodyText1.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: KColor.primary))
                ],
              ),
            ),
            Container(
              width: KSize.getWidth(context, 25),
              height: KSize.getHeight(context, 118),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {},
                      child: const Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Icon(
                            Icons.close,
                            size: 17,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.2),
                    child: Text(
                      "${widget.productcount.toString()}x",
                      style: KTextStyle.subtitle1
                          .copyWith(color: KColor.bodyText1),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
