import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/screens/checkout/page/add_new_address_screen.dart';
import 'package:ajapp/views/screens/checkout/page/payment_card_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<String> image = [
    AssetPath.visa,
    AssetPath.american,
    AssetPath.g13,
    AssetPath.paypal,
    AssetPath.applepay
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 2,
        leadingIconRequired: true,
        leadiconpress: () {
          Navigator.pop(context);
        },
        leadingicon: AssetPath.arrow,
        cartIconRequired: false,
        text: "Checkout",
        textRequired: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Delivery Address",
                    style: KTextStyle.bodyText2
                        .copyWith(color: KColor.bodyText1, fontSize: 14)),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: KSize.getWidth(context, 55),
                        height: KSize.getHeight(context, 60),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                                image: AssetImage(AssetPath.address),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                          width: KSize.getWidth(context, 210),
                          child: Text(
                            "83/3 HousingState, Amborkhana, Sylhet",
                            maxLines: 2,
                            style: KTextStyle.bodyText2.copyWith(
                                fontSize: 14,
                                color: KColor.primary,
                                overflow: TextOverflow.ellipsis),
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MapSample()));
                        },
                        child: Text(
                          "Change",
                          style: KTextStyle.bodyText2.copyWith(
                            fontSize: 14,
                            color: KColor.bodyText1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetPath.time),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Delivered in next 7 days",
                    style: KTextStyle.bodyText2.copyWith(
                      fontSize: 14,
                      color: KColor.primary,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Method",
                    style: KTextStyle.bodyText2.copyWith(
                      fontSize: 14,
                      color: KColor.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        image.length,
                        (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentCardScreen()));
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.all(KSize.getWidth(context, 5.0)),
                            child: Image.asset(
                              image[index],
                              width: KSize.getWidth(context, 59),
                              height: KSize.getWidth(context, 20),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: KSize.getWidth(context, 320),
                height: KSize.getHeight(context, 70),
                decoration: BoxDecoration(
                    color: KColor.grey100,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text(
                  "Add Voucher",
                  style: KTextStyle.bodyText1.copyWith(color: KColor.bodyText1),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text.rich(TextSpan(
                  text: "Note : ",
                  style: KTextStyle.bodyText2.copyWith(
                    fontSize: 14,
                    color: KColor.red,
                  ),
                  children: [
                    TextSpan(
                        text: "Use your order id at the payment. Your Id",
                        style: KTextStyle.bodyText2.copyWith(
                          fontSize: 14,
                          color: KColor.bodyText1,
                        ),
                        children: [
                          TextSpan(
                            text: " #154619",
                            style: KTextStyle.bodyText2.copyWith(
                              fontSize: 14,
                              color: KColor.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                " if you forget to put your order id we can’t confirm the payment",
                            style: KTextStyle.bodyText2.copyWith(
                              fontSize: 14,
                              color: KColor.bodyText1,
                            ),
                          )
                        ])
                  ])),
              const SizedBox(
                height: 30,
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Voucher : ",
                      style: KTextStyle.bodyText2.copyWith(
                        fontSize: 14,
                        color: KColor.bodyText1,
                      ),
                    ),
                    Text(
                      "-\$10.90",
                      style: KTextStyle.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: KColor.primary,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total : ",
                      style: KTextStyle.bodyText2.copyWith(
                        fontSize: 14,
                        color: KColor.primary,
                      ),
                    ),
                    Text(
                      "\$45.90",
                      style: KTextStyle.bodyText2.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: KColor.primary,
                      ),
                    )
                  ],
                ),
              ])
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        child: KButton(
          getHeight: KSize.getHeight(context, 56),
          getWidth: KSize.getWidth(context, 300),
          containerColor: KColor.primary,
          kbuttonTap: () {
            null;
          },
          text: "Pay Now",
          txtcolor: KColor.white,
          borderColor: KColor.primary,
        ),
      ),
    );
  }
}
