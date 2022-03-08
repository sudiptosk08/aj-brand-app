import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/product_card.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesFashion extends StatefulWidget {
  final String title;
  final bool? cartIcon;
  const CategoriesFashion({Key? key, this.cartIcon, required this.title})
      : super(key: key);
  static const pattern = [
    QuiltedGridTile(4, 2),
    QuiltedGridTile(4, 2),
  ];

  @override
  _CategoriesFashionState createState() => _CategoriesFashionState();
}

class _CategoriesFashionState extends State<CategoriesFashion> {
  List<Map<String, dynamic>> productList = [
    {
      'imagePath': AssetPath.product1,
      'name': 'AJ Full T-Shirt',
      'price': '18.25',
      'discountPrice': '22.50'
    },
    {
      'imagePath': AssetPath.product3,
      'name': 'AJ Full T-Shirt',
      'price': ' 18.25',
      'discountPrice': '22.50'
    },
    {
      'imagePath': AssetPath.product2,
      'name': 'AJ Full T-Shirt',
      'price': '18.25',
      'discountPrice': '22.50'
    },
    {
      'imagePath': AssetPath.bagProduct,
      'name': 'AJ Full T-Shirt',
      'price': '18.25',
      'discountPrice': ' 22.50'
    },
    {
      'imagePath': AssetPath.product5,
      'name': 'AJ Full T-Shirt',
      'price': '18.25',
      'discountPrice': ' 22.50'
    },
    {
      'imagePath': AssetPath.product6,
      'name': 'AJ Full T-Shirt',
      'price': '18.25',
      'discountPrice': '22.50'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 0.8,
        leadiconpress: () {
          Navigator.pop(context);
        },
        leadingicon: AssetPath.arrow,
        leadingIconRequired: true,
        text: widget.title,
        textRequired: true,
        cartIconRequired: widget.cartIcon,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.custom(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 24,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: CategoriesFashion.pattern,
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              final tile = CategoriesFashion
                  .pattern[10 % CategoriesFashion.pattern.length];
              return ProductCard(
                index: index,
                width: tile.crossAxisCount * 100,
                height: tile.mainAxisCount * 100,
                imagePath: productList[index]['imagePath'],
                discountprice: productList[index]['discountPrice'],
                price: productList[index]['price'],
                productname: productList[index]['name'],
                backgroundColor: KColor.dividerClr,
              );
            }, childCount: 6),
          )),
    );
  }
}
