import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/screens/cart/component/cart_card.dart';
import 'package:ajapp/views/screens/checkout/checkout_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartlist = [
    {
      'imagePath': AssetPath.product1,
      'colorText': 'Colors.red',
      'price': '\$12.20',
      'productcount': 1,
      'selectedColor': Colors.red,
      'sizeText': 'M',
      'titleText': "Aj Full T-Shirt",
    },
    {
      'imagePath': AssetPath.product2,
      'colorText': 'Colors.red',
      'price': '\$12.20',
      'productcount': 1,
      'selectedColor': Colors.amber,
      'sizeText': 'M',
      'titleText': "Aj Stylish Blazer",
    },
    {
      'imagePath': AssetPath.product3,
      'colorText': 'Colors.red',
      'price': '\$12.20',
      'productcount': 1,
      'selectedColor': Colors.blue,
      'sizeText': 'M',
      'titleText': "Aj Primium Watch for Man",
    },
    {
      'imagePath': AssetPath.product4,
      'colorText': 'Colors.red',
      'price': '\$12.20',
      'productcount': 1,
      'selectedColor': Colors.grey,
      'sizeText': 'M',
      'titleText': "Aj Sports Shoes",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 0,
        cartIconRequired: false,
        leadingIconRequired: true,
        leadingicon: AssetPath.arrow,
        leadiconpress: () {
          Navigator.pop(context);
        },
        text: "My Cart",
        textRequired: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cartlist.length,
                    itemBuilder: (context, index) => ShoppingCard(
                          imagePath: cartlist[index]['imagePath'],
                          colorText: cartlist[index]['colorText'],
                          price: cartlist[index]['price'],
                          productcount: cartlist[index]['productcount'],
                          selectedColor: cartlist[index]['selectedColor'],
                          sizeText: cartlist[index]['sizeText'],
                          titleText: cartlist[index]['titleText'],
                        )),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    height: KSize.getHeight(context, 170),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal:",
                              style: KTextStyle.subtitle1.copyWith(
                                color: KColor.bodyText1,
                              ),
                            ),
                            Text(
                              "\$50.95",
                              style: KTextStyle.subtitle1.copyWith(
                                  color: KColor.primary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tax:",
                              style: KTextStyle.subtitle1.copyWith(
                                color: KColor.bodyText1,
                              ),
                            ),
                            Text(
                              "\$1.95",
                              style: KTextStyle.subtitle1.copyWith(
                                  color: KColor.primary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping Fee:",
                              style: KTextStyle.subtitle1.copyWith(
                                color: KColor.bodyText1,
                              ),
                            ),
                            Text(
                              "\$3.95",
                              style: KTextStyle.subtitle1.copyWith(
                                  color: KColor.primary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: KTextStyle.subtitle1.copyWith(
                                color: KColor.primary,
                              ),
                            ),
                            Text(
                              "\$55.95",
                              style: KTextStyle.subtitle1.copyWith(
                                  color: KColor.primary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: KButton(
          getHeight: KSize.getHeight(context, 56),
          getWidth: KSize.getWidth(context, 300),
          containerColor: KColor.primary,
          kbuttonTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CheckoutScreen()));
          },
          text: "Checkout",
          txtcolor: KColor.white,
          borderColor: KColor.primary,
        ),
      ),
    );
  }
}
