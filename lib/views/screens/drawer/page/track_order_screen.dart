import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: KColor.grey350,
            image: const DecorationImage(
                image: AssetImage(
                  AssetPath.map,
                ),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Row(children: [
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AssetPath.arrow,
                  ),
                ),
                SizedBox(
                  width: KSize.getWidth(context, 105),
                ),
                Text(
                  "Track Order",
                  style: KTextStyle.bodyText1.copyWith(
                    color: KColor.primary,
                  ),
                ),
              ]),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: KColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                        top: KSize.getHeight(context, 20)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 25,
                          minRadius: 20,
                          backgroundColor: KColor.grey200,
                          child: const Icon(
                            Icons.access_time_rounded,
                            color: KColor.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Time",
                              style: KTextStyle.bodyText2
                                  .copyWith(color: KColor.bodyText1),
                            ),
                            Text(
                              "28 May, 5.30 PM",
                              style: KTextStyle.bodyText1.copyWith(
                                  color: KColor.primary,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 20,
                    ),
                    child: Image.asset(
                      AssetPath.dotedline,
                      color: KColor.grey,
                      width: 12,
                      height: KSize.getHeight(context, 25),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                        bottom: KSize.getHeight(context, 20)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 25,
                          minRadius: 20,
                          backgroundColor: KColor.grey200,
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: KColor.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Address",
                              style: KTextStyle.bodyText2
                                  .copyWith(color: KColor.bodyText1),
                            ),
                            Text(
                              "25/3 Housing state...",
                              style: KTextStyle.bodyText1.copyWith(
                                  color: KColor.primary,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: KColor.grey350,
                    thickness: 2,
                    endIndent: 30,
                    indent: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 25.0,
                        top: KSize.getHeight(context, 10),
                        bottom: KSize.getHeight(context, 20),
                        right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 25,
                              minRadius: 20,
                              backgroundColor: KColor.primary,
                              child: Image.asset(
                                AssetPath.appLogo,
                                width: 18,
                                height: 18,
                                fit: BoxFit.cover,
                                color: KColor.white,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Contact",
                                  style: KTextStyle.bodyText2
                                      .copyWith(color: KColor.bodyText1),
                                ),
                                Text(
                                  "Aj Shop",
                                  style: KTextStyle.bodyText1.copyWith(
                                      color: KColor.primary,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: KColor.grey100,
                                child: Image.asset(AssetPath.call),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundColor: KColor.grey100,
                                child: Image.asset(AssetPath.chat),
                              )
                            ],
                          ),
                        )
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
  }
}
