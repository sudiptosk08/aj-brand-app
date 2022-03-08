import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/screens/drawer/component/myorder_card.dart';
import 'package:ajapp/views/screens/drawer/page/track_order_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  List<Map<String, dynamic>> orderList = [
    {
      "orderId": "213568",
      "orderprice": "150",
      "orderdate": "3rd Fed,2022",
      "color": KColor.blue,
    },
    {
      "orderId": "650420",
      "orderprice": "200",
      "orderdate": "13 Mar,2022",
      "color": KColor.green,
    },
    {
      "orderId": "213568",
      "orderprice": "150",
      "orderdate": "10 Fed,2022",
      "color": KColor.orange,
    },
    {
      "orderId": "213568",
      "orderprice": "150",
      "orderdate": "3rd Jan,2022",
      "color": KColor.red,
    },
  ];

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
        cartIconRequired: false,
        text: "My order",
        textRequired: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                height: KSize.getHeight(context, 190),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Id #154619",
                            style: KTextStyle.bodyText2
                                .copyWith(color: KColor.primary),
                          ),
                          Text(
                            "In Progress",
                            style: KTextStyle.bodyText2
                                .copyWith(color: KColor.green),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: KSize.getWidth(context, 180),
                            height: KSize.getHeight(context, 80),
                            child: Stack(
                              children: [
                                Transform.scale(
                                  scale: 1,
                                  //offset: const Offset(0, 0),
                                  child: Container(
                                    width: KSize.getWidth(context, 80),
                                    height: KSize.getHeight(context, 80),
                                    decoration: BoxDecoration(
                                      color: KColor.grey200,
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                          image: AssetImage(AssetPath.product1),
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  child: Transform.scale(
                                    scale: 1,
                                    //offset: const Offset(0, 0),
                                    child: Container(
                                      width: KSize.getWidth(context, 80),
                                      height: KSize.getHeight(context, 80),
                                      decoration: BoxDecoration(
                                          color: KColor.grey200,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  AssetPath.product4))),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Transform.scale(
                                    scale: 1,
                                    //offset: const Offset(0, 0),
                                    child: Container(
                                      width: KSize.getWidth(context, 80),
                                      height: KSize.getHeight(context, 80),
                                      decoration: BoxDecoration(
                                          color: KColor.saleContainerColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  AssetPath.product3))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: KSize.getHeight(context, 80),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "AJ Full T-Shirt",
                                  style: KTextStyle.bodyText1.copyWith(
                                      color: KColor.primary,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "and 2 more",
                                  style: KTextStyle.bodyText2.copyWith(
                                      color: KColor.bodyText1,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your order is on way!",
                                style: KTextStyle.subtitle1.copyWith(
                                    color: KColor.primary,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "will receive in 2 days",
                                style: KTextStyle.bodyText2.copyWith(
                                    color: KColor.bodyText1,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TrackOrder()));
                            },
                            child: Container(
                                width: KSize.getWidth(context, 110),
                                height: KSize.getHeight(context, 45),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: KColor.primary),
                                child: Text(
                                  "Track",
                                  style: KTextStyle.bodyText2
                                      .copyWith(color: KColor.white),
                                )),
                          )
                        ],
                      )
                    ]),
              ),
            ),
            ...List.generate(
                orderList.length,
                (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyOrderCard(
                            color: orderList[index]['color'],
                            orderId: orderList[index]['orderId'],
                            orderprice: orderList[index]['orderprice'],
                            orderdate: orderList[index]['orderdate'],
                            detailstxt: "Nai",
                          ),
                        ]))
          ],
        ),
      )),
    );
  }
}
