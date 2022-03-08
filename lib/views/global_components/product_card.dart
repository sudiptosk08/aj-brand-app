import 'dart:math';

import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/screens/product_details/product_details_page.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.index,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.productname,
    required this.price,
    required this.discountprice,
    required this.backgroundColor,
  }) : super(key: key);
  final int index;
  final int width;
  final int height;
  final String imagePath;
  final String productname;
  final String price;
  final String discountprice;
  final Color backgroundColor;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Color randomColor() =>
        Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(0.2);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                      id: 1,
                      productName: widget.productname,
                      price: widget.price,
                      discountPrice: widget.discountprice,
                      thumbnail: widget.imagePath,
                    )));
      },
      child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 4,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: randomColor(),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      widget.imagePath,
                      width: widget.width.toDouble(),
                      height: widget.height.toDouble(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: 12,
                    top: 12,
                    child: CircleAvatar(
                        backgroundColor: KColor.white,
                        maxRadius: 15,
                        child: Icon(
                          Icons.favorite,
                          color: KColor.grey350,
                          size: 18,
                        )))
              ]),
            ),
            Expanded(
              //fit: FlexFit.tight,
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 14.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 4,
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.productname,
                    style: KTextStyle.subtitle1.copyWith(color: KColor.primary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 3.0),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text("\$${widget.price}",
                          style: KTextStyle.subtitle1
                              .copyWith(color: KColor.primary)),
                    ),
                    Stack(children: [
                      Text(
                        "\$${widget.discountprice}",
                        style: KTextStyle.subtitle1
                            .copyWith(color: KColor.accentColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Positioned(
                          top: 6,
                          child: Image.asset(
                            AssetPath.vector,
                            fit: BoxFit.fill,
                          ))
                    ])
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
