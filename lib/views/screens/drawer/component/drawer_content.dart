import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_cart_component.dart';
import 'package:ajapp/views/screens/drawer/component/drawer_item_card.dart';
import 'package:ajapp/views/screens/drawer/page/categories_fashion_page.dart';
import 'package:ajapp/views/screens/drawer/page/favorite_product.dart';
import 'package:ajapp/views/screens/drawer/page/my_order_screen.dart';
import 'package:ajapp/views/screens/drawer/page/profile_screen.dart';
import 'package:ajapp/views/screens/home/page/allroduct_list_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  List<String> item = [
    "Profile",
    "Categories",
    "On Sale",
    "Favorite Items",
    "My Order"
  ];
  bool categorySelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: KColor.primary.withOpacity(0.3),
      child: categorySelected == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            AssetPath.drawerclose,
                          ),
                        ),
                        const KCartComponent(
                          color: KColor.white,
                        )
                      ],
                    )),
                SizedBox(
                  height: 390,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DrawerItem(
                        txt: "Profile",
                        sign: "",
                        color: KColor.white,
                        iconData: Icons.arrow_forward_ios,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>const ProfileScreen()));
                        },
                      ),
                      DrawerItem(
                        txt: "Categories",
                        sign: " >",
                        color: KColor.white,
                        iconData: Icons.arrow_forward_ios,
                        ontap: () {
                          setState(() {
                            categorySelected = false;
                          });
                        },
                      ),
                      DrawerItem(
                        txt: "On Sale",
                        sign: "",
                        color: KColor.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const AllProductPage(
                                        title: "On Sale",
                                        cartIcon: false,
                                      )));
                        },
                      ),
                      DrawerItem(
                        txt: "Favorite Items",
                        sign: "",
                        color: KColor.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const FavoriteProductPage(
                                        imagePath:
                                            'https://picsum.photos/500/500?random=index',
                                        title: "Favorite Items",
                                        cartIcon: false,
                                      )));
                        },
                      ),
                      DrawerItem(
                        txt: "My Order",
                        color: KColor.white,
                        sign: "",
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const MyOrderScreen()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                DrawerItem(
                  txt: "Logout",
                  sign: "",
                  color: KColor.red,
                  ontap: () {
                    null;
                  },
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              categorySelected = true;
                            });
                          },
                          child: Image.asset(
                            AssetPath.drawerclose,
                          ),
                        ),
                        const KCartComponent(
                          color: KColor.white,
                        )
                      ],
                    )),
                SizedBox(
                  height: KSize.getHeight(context, 390),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      DrawerItem(
                        txt: "Man Fashion",
                        sign: "",
                        color: KColor.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CategoriesFashion(
                                        
                                        title: "Man Fashion",
                                        cartIcon: true,
                                      )));
                        },
                      ),
                      DrawerItem(
                        txt: "Women Fashion",
                        sign: "",
                        color: KColor.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CategoriesFashion(
                                        title: "Women Fashion",
                                        cartIcon: true,
                                      )));
                        },
                      ),
                      DrawerItem(
                        txt: "Wallet",
                        sign: "",
                        color: KColor.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CategoriesFashion(
                                        title: "Walet",
                                        cartIcon: true,
                                      )));
                        },
                      ),
                      DrawerItem(
                        txt: "Watch",
                        sign: "",
                        color: KColor.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CategoriesFashion(
                                        title: "Watch",
                                        cartIcon: true,
                                      )));
                        },
                      ),
                      DrawerItem(
                        txt: "Bag",
                        sign: "",
                        color: KColor.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CategoriesFashion(
                                        title: "Bag",
                                        cartIcon: true,
                                      )));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                DrawerItem(
                  txt: "Logout",
                  sign: "",
                  color: KColor.red,
                  ontap: () {
                    null;
                  },
                ),
              ],
            ),
    );
  }
}
