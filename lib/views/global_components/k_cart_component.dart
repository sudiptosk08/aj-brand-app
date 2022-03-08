import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/screens/cart/cart_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class KCartComponent extends StatefulWidget {
  final bool isHomePage;
  final Color? color;
  const KCartComponent({
    Key? key,
    this.isHomePage = false,
    this.color,
  }) : super(key: key);

  @override
  State<KCartComponent> createState() => _KCartComponentState();
}

class _KCartComponentState extends State<KCartComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CartScreen()));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetPath.bag,
              height: KSize.getHeight(context, 26),
              width: KSize.getWidth(context, 23),
              color: widget.color,
            ),
          ),
          Positioned(
            top: 1,
            right: 1,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: widget.isHomePage ? KColor.orange : KColor.red,
                  shape: BoxShape.circle),
              child: Text(
                '2',
                style: KTextStyle.overline
                    .copyWith(color: KColor.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
