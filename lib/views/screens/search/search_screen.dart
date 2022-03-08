import 'dart:math';

import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_button.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> notes = [];
  final List<String> titleList = [
    'LEATHER COAT',
    'STRIP SHIRT',
    'WALLET',
    'WATCH',
  ];

  final List<String> gender = [
    'Man',
    'Women',
    'Both',
  ];
  final List<String> imageList = [
    AssetPath.profile,
    AssetPath.profile,
    AssetPath.profile,
    AssetPath.profile,
    AssetPath.profile,
  ];

  final List<String> size = ['S', 'M', 'L', 'XL', 'XXL'];
  List<FlutterSliderTooltipDirection> values = [];

  List<String> search(String key) {
    return titleList
        .where(
            (itemName) => itemName.toLowerCase().startsWith(key.toLowerCase()))
        .toList();
  }

  // ignore: prefer_typing_uninitialized_variables
  var selectedgender;
  // ignore: prefer_typing_uninitialized_variables
  var selectedsize;
  // ignore: unused_field
  final double _lowerValue = 1;
  // ignore: unused_field
  final double _upperValue = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: KSize.getHeight(context, 58),
                    width: KSize.getHeight(context, 243),
                    decoration: BoxDecoration(
                        color: KColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.4))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        onChanged: (key) {
                          setState(() {
                            if (key.isEmpty) {
                              notes = [];
                            } else {
                              notes = search(key);
                            }
                          });
                        },
                        decoration: InputDecoration(
                            hintText: 'Search',
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                top: KSize.getHeight(context, 14),
                                bottom: KSize.getHeight(context, 14),
                                left: KSize.getHeight(context, 18),
                                right: KSize.getHeight(context, 14),
                              ),
                              child: Image.asset(
                                AssetPath.search,
                                color: KColor.greyDark,
                                height: KSize.getHeight(context, 24),
                                width: KSize.getWidth(context, 24),
                                fit: BoxFit.contain,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 12)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: KSize.getWidth(context, 16)),
                //const Spacer(),

                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context, setState) {
                              return Container(
                                height: KSize.getHeight(context, 550),
                                decoration: const BoxDecoration(
                                    color: KColor.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0))),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                KSize.getWidth(context, 24)),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: KSize.getHeight(
                                                      context, 15)),
                                              Center(
                                                child: Image.asset(
                                                  AssetPath.holder,
                                                  height: KSize.getHeight(
                                                      context, 4),
                                                  width: KSize.getWidth(
                                                      context, 54),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: KSize.getWidth(
                                                        context, 137)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Filter",
                                                      style: KTextStyle
                                                          .headline5
                                                          .copyWith(
                                                        fontSize: 24,
                                                        color: KColor.primary,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Clear",
                                                      style: KTextStyle
                                                          .bodyText2
                                                          .copyWith(
                                                        color: KColor.bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Center(
                                                  child: Text(
                                                "Gender",
                                                style: KTextStyle.bodyText1
                                                    .copyWith(
                                                        color:
                                                            KColor.bodyText1),
                                              )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                      gender.length,
                                                      (index) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedgender =
                                                                      index;
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: selectedgender ==
                                                                          index
                                                                      ? KColor
                                                                          .primary
                                                                      : KColor
                                                                          .greybg,
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          18.0,
                                                                      vertical:
                                                                          8),
                                                                  child: Text(
                                                                    gender[
                                                                        index],
                                                                    style: KTextStyle
                                                                        .bodyText2
                                                                        .copyWith(
                                                                            color: selectedgender == index
                                                                                ? KColor.white
                                                                                : KColor.primary),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Center(
                                                  child: Text(
                                                "Size",
                                                style: KTextStyle.bodyText1
                                                    .copyWith(
                                                        color:
                                                            KColor.bodyText1),
                                              )),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                      size.length,
                                                      (index) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  selectedsize =
                                                                      index;
                                                                });
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  color: selectedsize ==
                                                                          index
                                                                      ? KColor
                                                                          .primary
                                                                      : KColor
                                                                          .greybg,
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          18.0,
                                                                      vertical:
                                                                          8),
                                                                  child: Text(
                                                                    size[index],
                                                                    style: KTextStyle
                                                                        .bodyText2
                                                                        .copyWith(
                                                                            color: selectedsize == index
                                                                                ? KColor.white
                                                                                : KColor.primary),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Center(
                                                  child: Text(
                                                "Price",
                                                style: KTextStyle.bodyText1
                                                    .copyWith(
                                                        color:
                                                            KColor.bodyText1),
                                              )),
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    KSize.getWidth(context, 4)),
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 2,
                                                            left: 20,
                                                            right: 20),
                                                    alignment:
                                                        Alignment.topCenter,
                                                    height: 110,
                                                    child: FlutterSlider(
                                                      values: const [1, 9999],
                                                      rangeSlider: true,
                                                      max: 9999,
                                                      min: 1,
                                                      step:
                                                          const FlutterSliderStep(
                                                              step: 10),
                                                      jump: true,
                                                      handlerWidth: 55,
                                                      handlerHeight: 10,
                                                      trackBar:
                                                          const FlutterSliderTrackBar(
                                                        inactiveTrackBarHeight:
                                                            2,
                                                        activeTrackBar:
                                                            BoxDecoration(
                                                          color: KColor.primary,
                                                        ),
                                                        activeTrackBarHeight: 3,
                                                      ),
                                                      disabled: false,
                                                      handler: customHandler(
                                                          Icons.chevron_right),
                                                      rightHandler:
                                                          customHandler(Icons
                                                              .chevron_left),
                                                      tooltip:
                                                          FlutterSliderTooltip(
                                                        custom: (value) =>
                                                            Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 70.0),
                                                          child: SizedBox(
                                                              child: Text(
                                                                  "\$${value}")),
                                                        ),
                                                        direction:
                                                            FlutterSliderTooltipDirection
                                                                .top,
                                                        alwaysShowTooltip: true,
                                                        leftPrefix: const Icon(
                                                            Icons.attach_money,
                                                            size: 12,
                                                            color:
                                                                KColor.primary),
                                                        rightPrefix: const Icon(
                                                          Icons.attach_money,
                                                          size: 12,
                                                          color: KColor.primary,
                                                        ),
                                                        textStyle:
                                                            const TextStyle(
                                                          fontSize: 12,
                                                          color: KColor.primary,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: KSize.getHeight(
                                                        context, 0)),
                                                child: KButton(
                                                  text: "Apply",
                                                  txtcolor: KColor.white,
                                                  containerColor:
                                                      KColor.primary,
                                                  getWidth: KSize.getWidth(
                                                      context, 327),
                                                  getHeight: KSize.getHeight(
                                                      context, 56),
                                                  borderColor: KColor.primary,
                                                  kbuttonTap: () {},
                                                ),
                                              )
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  },
                  child: Container(
                    width: 55,
                    height: KSize.getHeight(context, 58),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage(AssetPath.fillter))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Recent Search",
              style: KTextStyle.headline5.copyWith(color: KColor.primary),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: notes.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 7.0,
                    ),
                    child: Container(
                      height: KSize.getHeight(context, 30),
                      decoration: BoxDecoration(
                          color: KColor.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                /// Category Image List
                                Image.asset(AssetPath.clock,
                                    height: KSize.getHeight(context, 18),
                                    width: KSize.getWidth(context, 17),
                                    fit: BoxFit.contain),
                                SizedBox(width: KSize.getWidth(context, 8)),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(titleList[index],
                                          style: KTextStyle.headline6.copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ));
  }

  FlutterSliderHandler customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: const BoxDecoration(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: KColor.primary, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.black,
            size: 0,
          ),
        ),
      ),
    );
  }
}
