import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FAQCard extends StatefulWidget {
  String headingtxt;
  String detailstxt;
  FAQCard({Key? key,required this.headingtxt,required this.detailstxt}) : super(key: key);

  @override
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
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
    return GestureDetector(
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
         const SizedBox(height: 5,),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
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
            child: Container(
              decoration: const BoxDecoration(
                color: KColor.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.headingtxt,
                      textAlign: TextAlign.justify,
                      style: KTextStyle.subtitle2
                          .copyWith(color: KColor.primary, fontSize: 20),
                      maxLines: 2,
                    ),
                  ),
                  if (secondaryIndex == 0)
                    SizedBox(height: KSize.getHeight(context, 7)),
                  if (secondaryIndex == 0)
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                       widget.detailstxt,
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
          ),
          const SizedBox(
            height: 15,
          ),
         
        ],
      ),
    );
  }
}
