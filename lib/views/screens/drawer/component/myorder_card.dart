import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyOrderCard extends StatefulWidget {
  String orderId;
  String? orderprice;
  String? orderdate;
  Color? color;
  final String? detailstxt;

  MyOrderCard(
      {Key? key,
      required this.orderId,
      this.detailstxt,
      this.orderdate,
      this.orderprice,
      this.color})
      : super(key: key);

  @override
  _MyOrderCardState createState() => _MyOrderCardState();
}

class _MyOrderCardState extends State<MyOrderCard> {
  int secondaryIndex = -1;
  int primaryIndex = 0;

  void changeIndex(int index) {
    setState(() {
      secondaryIndex = index;
    });
  }

  void changePrimaryIndex(int index) {
    setState(() {
      primaryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 1, right: 20, bottom: 1),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (secondaryIndex == -1) {
              secondaryIndex = 0;
            } else {
              setState(() {
                secondaryIndex = -1;
              });
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: const BoxDecoration(
                color: KColor.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: widget.color,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "#${widget.orderId}",
                                      textAlign: TextAlign.justify,
                                      style: KTextStyle.bodyText1
                                          .copyWith(color: KColor.primary),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$ ${widget.orderprice}",
                                      textAlign: TextAlign.justify,
                                      style: KTextStyle.bodyText2.copyWith(
                                        color: KColor.bodyText1,
                                      ),
                                      maxLines: 2,
                                    ),
                                    const Text(" - "),
                                    Text(
                                      " ${widget.orderdate}",
                                      textAlign: TextAlign.justify,
                                      style: KTextStyle.bodyText2
                                          .copyWith(color: KColor.bodyText1),
                                      maxLines: 2,
                                    ),
                                  ],
                                )
                              ]),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          )
                        ]),
                  ),
                  if (secondaryIndex == 0)
                    SizedBox(height: KSize.getHeight(context, 7)),
                  if (secondaryIndex == 0)
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.detailstxt!,
                        textAlign: TextAlign.justify,
                        style: KTextStyle.bodyText1.copyWith(
                          color: KColor.bodyText1,
                          fontSize: 16,
                        ),
                        maxLines: 6,
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
