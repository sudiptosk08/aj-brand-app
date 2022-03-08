import 'package:ajapp/constants/asset_path.dart';

import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/screens/drawer/model/favorite_model.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoriteProductPage extends StatefulWidget {
  final String imagePath;

  final String title;
  final bool cartIcon;
  const FavoriteProductPage(
      {Key? key,
      required this.imagePath,
      required this.cartIcon,
      required this.title})
      : super(key: key);
  static const pattern = [
    QuiltedGridTile(3, 2),
    QuiltedGridTile(2, 2),
  ];

  @override
  _FavoriteProductPageState createState() => _FavoriteProductPageState();
}

class _FavoriteProductPageState extends State<FavoriteProductPage> {
  var selectedItem = false;
  List<FavoriteModel> productlist = [
    FavoriteModel(AssetPath.product1, false),
    FavoriteModel(AssetPath.bagProduct, false),
    FavoriteModel(AssetPath.product2, false),
    FavoriteModel(AssetPath.watch, false),
    FavoriteModel(AssetPath.product5, false),
    FavoriteModel(AssetPath.shoes, false),
  ];

  List<FavoriteModel> selectedproductlist = [];
  bool? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
         centerPadding: 2,
        leadiconpress: () {
          Navigator.pop(context);
        },
        leadingicon: AssetPath.arrow,
        leadingIconRequired: true,
        text: widget.title,
        textRequired: true,
        cartIconRequired: widget.cartIcon,
      ),
      body: Stack(children: [
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 18,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: FavoriteProductPage.pattern,
              ),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                final tile = FavoriteProductPage
                    .pattern[10 % FavoriteProductPage.pattern.length];
                return FavoriteItemm(
                    productlist[index].imagePath,
                    tile.crossAxisCount * 100,
                    tile.mainAxisCount * 100,
                    productlist[index].isSelected,
                    index);
              }, childCount: 6),
            )),
        value == true
            ? Positioned(
                bottom: KSize.getHeight(context, -5),
                child: Padding(
                  padding: const EdgeInsets.all(23),
                  child: KButton(
                    text: "Remove",
                    txtcolor: KColor.white,
                    containerColor: KColor.primary,
                    getWidth: KSize.getWidth(context, 327),
                    getHeight: KSize.getHeight(context, 56),
                    borderColor: KColor.primary,
                    kbuttonTap: () {},
                  ),
                ))
            : Container()
      ]),
    );
  }

  // ignore: non_constant_identifier_names
  Widget FavoriteItemm(String imagePath, double width, double height,
      bool isSelected, int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        flex: 1,
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imagePath,
              width: width, //ttle.crossAxisCount *100
              height: height, //tile.mainAxisCount * 100
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              right: 12,
              top: 12,
              child: InkWell(
                onTap: () {
                  setState(() {
                    productlist[index].isSelected =
                        !productlist[index].isSelected;
                    value = productlist[index].isSelected;
                    if (productlist[index].isSelected == true) {
                      selectedproductlist.add(FavoriteModel(imagePath, true));
                    } else if (productlist[index].isSelected == false) {
                      selectedproductlist.removeWhere((element) =>
                          element.imagePath == productlist[index].imagePath);
                    }
                  });
                },
                child: CircleAvatar(
                    backgroundColor: KColor.white,
                    maxRadius: 15,
                    child: productlist[index].isSelected
                        ? Icon(
                            Icons.check,
                            color: KColor.grey,
                            size: 18,
                          )
                        : Icon(
                            Icons.favorite,
                            color: KColor.red,
                            size: 18,
                          )),
              ))
        ]),
      ),
      SizedBox(
        height: KSize.getHeight(context, 4),
      ),
    ]);
  }
}
