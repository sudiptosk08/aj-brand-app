import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/screens/settings/component/faq_question_card.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<Map<String, dynamic>> faqlist = [
    {
      "headingtxt": "1. How do I place an order on your website?",
      "detailstxt":
          "All you need to do to place an order on our wesbite is to choose the product that you would like to buy, then add it to cart and pay for it using any of the supported payment methods. "
    },
    {
      "headingtxt": "2. What is your return policy?",
      "detailstxt":
          "All you need to do to place an order on our wesbite is to choose the product that you would like to buy, then add it to cart and pay for it using any of the supported payment methods. "
    },
    {
      "headingtxt": "3. What shipping company do you use?",
      "detailstxt":
          "All you need to do to place an order on our wesbite is to choose the product that you would like to buy, then add it to cart and pay for it using any of the supported payment methods. "
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 2,
        leadingIconRequired: true,
        leadingicon: AssetPath.arrow,
        leadiconpress: () {
          Navigator.pop(context);
        },
        text: "FAQ",
        textRequired: true,
        cartIconRequired: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Frequently Asked"
              " Questions",
              style: KTextStyle.headline5.copyWith(
                color: KColor.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "General",
              style: KTextStyle.subtitle2.copyWith(color: KColor.bodyText1),
            ),
            ...List.generate(
                3,
                (index) => Column(children: [
                      FAQCard(
                        headingtxt: faqlist[index]['headingtxt'],
                        detailstxt: faqlist[index]['detailstxt'],
                      ),
                      const Divider(
                        color: KColor.dividerClr,
                        thickness: 1,
                      )
                    ]))
          ],
        ),
      )),
    );
  }
}
