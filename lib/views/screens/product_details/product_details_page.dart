import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/global_components/k_cart_component.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
// import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  final String? thumbnail;
  final String? productName;
  final String? price;
  final String? discountPrice;
  //final ProductModel product;

  // ignore: use_key_in_widget_constructors
  const ProductDetailsScreen({
    Key? key,
    required this.id,
    this.thumbnail,
    this.productName,
    this.price,
    this.discountPrice,
    //required this.product,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Map<String, dynamic>> colors1 = [
    {"color1": KColor.blue},
    {"color1": KColor.red},
    {"color1": KColor.seenGreen},
  ];
  List<Map<String, dynamic>> myOrder = [
    {"text": "S"},
    {"text": "M"},
    {"text": "L"},
    {"text": "XL"},
  ];
  // ignore: prefer_typing_uninitialized_variables
  var selectColorIndex;
  // ignore: prefer_typing_uninitialized_variables
  var brandIndex;
  var count = 1;
  final controller = PageController(viewportFraction: 1.0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      3,
      (index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.grey[300],
            image: DecorationImage(
                image: AssetImage(widget.thumbnail.toString()),
                fit: BoxFit.cover)),
        //margin: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      ),
    );
    return Scaffold(
        backgroundColor: KColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    height: KSize.getHeight(context, 500),
                    child: PageView.builder(
                      controller: controller,
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: KColor.appBarTitle,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 27,
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 60,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: KColor.white,
                            size: 28,
                          ))),
                  const Positioned(
                      top: 15,
                      right: 20,
                      child: KCartComponent(
                        color: KColor.primary,
                      )),
                  Positioned(
                    width: KSize.getWidth(context, 375),
                    bottom: 40,
                    child: Center(
                      child: SizedBox(
                        // color: Colors.red.withOpacity(.4),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: pages.length,
                          effect: CustomizableEffect(
                            activeDotDecoration: DotDecoration(
                              width: 50,
                              height: 4,
                              color: Colors.white,
                              rotationAngle: 0,
                              verticalOffset: 0,
                              borderRadius: BorderRadius.circular(24),
                              // dotBorder: DotBorder(
                              //   padding: 2,
                              //   width: 2,
                              //   color: Colors.indigo,
                              // ),
                            ),
                            dotDecoration: DotDecoration(
                              width: 15,
                              height: 4,
                              color: Colors.grey[400]!,
                              borderRadius: BorderRadius.circular(16),
                              verticalOffset: 0,
                            ),
                            spacing: 6.0,
                            // activeColorOverride: (i) => colors[i],
                            //inActiveColorOverride: (i) => colors[i],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                Transform.translate(
                    offset: Offset(0, -20),
                    child: Container(
                      width: KSize.getWidth(context, 375),
                      height: KSize.getWidth(context, 27),
                      decoration: BoxDecoration(
                          color: KColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(23),
                              topRight: Radius.circular(23))),
                    )),
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "AJ Full T-Shirt",
                            style: KTextStyle.headline5.copyWith(
                                color: KColor.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Size",
                                      style: KTextStyle.bodyText1.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: KColor.black),
                                    ),
                                    SizedBox(
                                      width: KSize.getWidth(context, 168),
                                      height: KSize.getHeight(context, 75),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(children: [
                                          ...List.generate(
                                              myOrder.length,
                                              (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 7, top: 2),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          brandIndex = index;
                                                        });
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 33,
                                                        width: 33,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          color: brandIndex ==
                                                                  index
                                                              ? KColor.primary
                                                              : KColor.secondary
                                                                  .withOpacity(
                                                                      0.2),
                                                        ),
                                                        child: Text(
                                                          myOrder[index]
                                                              ['text'],
                                                          style: KTextStyle
                                                              .bodyText2
                                                              .copyWith(
                                                                  color: brandIndex ==
                                                                          index
                                                                      ? KColor
                                                                          .white
                                                                      : KColor
                                                                          .accentColor),
                                                        ),
                                                      )))),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: KSize.getWidth(context, 12),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "",
                                      style: KTextStyle.bodyText2.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: KColor.black),
                                    ),
                                    SizedBox(
                                      width: KSize.getWidth(context, 130),
                                      height: KSize.getHeight(context, 75),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ...List.generate(
                                                  colors1.length,
                                                  (index) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 6, top: 2),
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectColorIndex =
                                                                  index;
                                                            });
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 32,
                                                              width: 32,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            35),
                                                                color: colors1[
                                                                        index]
                                                                    ['color1'],
                                                              ),
                                                              child: selectColorIndex ==
                                                                      index
                                                                  ? const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: KColor
                                                                          .white,
                                                                    )
                                                                  : Container())))),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'BDT \$20.00',
                                    style: KTextStyle.headline5.copyWith(
                                      fontSize: 20,
                                      color: KColor.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Stack(children: [
                                    Text(
                                      '\$18.50',
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count == 1 ? count : --count;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(19),
                                              border: Border.all(
                                                  color: KColor.grey)),
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                            color: KColor.grey,
                                          ),
                                        )),
                                    const SizedBox(width: 6),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Text(
                                          count.toString(),
                                          style: KTextStyle.bodyText1.copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    const SizedBox(width: 6),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(19),
                                              border: Border.all(
                                                  color: KColor.grey)),
                                          child: Icon(
                                            Icons.add,
                                            size: 15,
                                            color: KColor.grey,
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: KSize.getHeight(context, 15),
            right: KSize.getHeight(context, 15),
            top: KSize.getHeight(context, 5),
            bottom: KSize.getHeight(context, 5),
          ),
          child: KButton(
            getWidth: KSize.getWidth(context, 180),
            getHeight: KSize.getHeight(context, 60),
            kbuttonTap: () {
              // Navigator.push(
              //     context,
              //     CupertinoPageRoute<void>(
              //         builder: (BuildContext context) =>
              //             const CartScreen()));
            },
            containerColor: KColor.primary,
            borderColor: KColor.primary,
            txtcolor: KColor.white,
            text: "Add To Cart",
          ),
        ));
  }
}
