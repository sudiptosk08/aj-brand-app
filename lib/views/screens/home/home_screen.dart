// ignore_for_file: prefer_const_constructors

import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_cart_component.dart';
import 'package:ajapp/views/global_components/product_card.dart';
import 'package:ajapp/views/helper/bottom_navbar_visibility_notifier.dart';
import 'package:ajapp/views/screens/bottom_navbar/bottom_navigation_page.dart';
import 'package:ajapp/views/screens/drawer/component/drawer_content.dart';
import 'package:ajapp/views/screens/home/page/allroduct_list_screen.dart';
import 'package:ajapp/views/screens/drawer/custom_drawer_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const pattern = [
    QuiltedGridTile(4, 2),
    QuiltedGridTile(3, 2),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      'imagePath': AssetPath.shoes,
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
        backgroundColor: KColor.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                    child: ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Discover",
                                    style: KTextStyle.headline4
                                        .copyWith(color: KColor.primary),
                                  ),
                                  Text("Explore our premium product!",
                                      style: KTextStyle.caption
                                          .copyWith(color: KColor.bodyText1)),
                                ]),
                            const SizedBox(
                              width: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Sort By",
                                    style: KTextStyle.bodyText2.copyWith(
                                        color: KColor.primary,
                                        fontWeight: FontWeight.w600)),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            )
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: KSize.getHeight(context, 178),
                        width: KSize.getWidth(context, 340),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image: AssetImage(AssetPath.banner),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Products",
                            style: KTextStyle.headline5
                                .copyWith(color: KColor.primary),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const AllProductPage(
                                            title: "All Products",
                                            cartIcon: true,
                                          )));
                            },
                            child: SizedBox(
                              height: 14,
                              child: Text(
                                "See all",
                                style: KTextStyle.bodyText2
                                    .copyWith(color: KColor.primary),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]))
              ];
            },
            body: GridView.custom(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: HomeScreen.pattern,
              ),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                final tile = HomeScreen.pattern[10 % HomeScreen.pattern.length];
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
              }, childCount: productList.length),
            ),
          ),
        )));
  }
}
