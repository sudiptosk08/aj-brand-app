// ignore_for_file: file_names

import 'package:ajapp/views/global_components/k_cart_component.dart';
import 'package:ajapp/views/styles/k_text_style.dart';
import 'package:flutter/material.dart';
import 'package:ajapp/views/styles/k_colors.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: use_key_in_widget_constructors
  const KAppBar({
    Key? key,
    this.text,
    this.leadiconpress,
    this.leadingicon,
    this.sufixiconpress,
    this.sufixicon,
    this.kToolbarHeight,
    required this.centerPadding,
    this.elevation,
    this.color = KColor.white,
    this.cartIconRequired = true,
    this.suffixIconRequired = false,
    this.leadingIconRequired = false,
    this.textRequired,
  }) : preferredSize = const Size.fromHeight(55);
  final String? text;
  final String? leadingicon;
  final Color color;
  final String? sufixicon;
  final GestureTapCallback? leadiconpress;
  final GestureTapCallback? sufixiconpress;
  final double? kToolbarHeight;
  final double centerPadding;
  final double? elevation;
  final bool? cartIconRequired;
  final bool? suffixIconRequired;
  final bool? leadingIconRequired;
  final bool? textRequired;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, right: centerPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leadingIconRequired!
                    ? Builder(builder: (context) {
                        return InkWell(
                          onTap: leadiconpress,
                          child: Image.asset(
                            leadingicon!,
                          ),
                        );
                      })
                    : Container(),
                textRequired!
                    ? Text(
                        text!,
                        style: KTextStyle.bodyText1.copyWith(
                          color: KColor.primary,
                        ),
                      )
                    : Container(),
                Row(
                  children: [
                    suffixIconRequired!
                        ? Builder(builder: (context) {
                            return InkWell(
                              onTap: sufixiconpress,
                              child: Image.asset(sufixicon!),
                            );
                          })
                        : Container(),
                    cartIconRequired! ? const KCartComponent() : Container(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      elevation: 0,
    );
  }
}
