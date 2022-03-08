import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_appbar.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> language = [
    "English(UK)",
    "English(US)",
    "Hindi",
    "Bangla",
    "Urdu",
    "Japani",
    "Parshi",
    "Arabic",
    "Greek"
  ];
  var selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        centerPadding: 2,
        leadingicon: AssetPath.arrow,
        leadiconpress: () {
          Navigator.pop(context);
        },
        leadingIconRequired: true,
        text: "Language",
        textRequired: true,
        cartIconRequired: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: KSize.getHeight(context, 58),
                width: KSize.getWidth(context, 353),
                decoration: BoxDecoration(
                    color: KColor.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(0.4))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextField(
                    onChanged: (key) {},
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
            const SizedBox(
              height: 20,
            ),
            ...List.generate(
              language.length,
              (index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 12, right: 25.0, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            language[index],
                            style: KTextStyle.bodyText1,
                          ),
                          selectedIndex == index
                              ? const Icon(
                                  Icons.check,
                                  size: 17,
                                )
                              : const Icon(
                                  Icons.ac_unit,
                                  color: KColor.white,
                                  size: 0.2,
                                ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: KColor.dividerClr,
                    endIndent: 27,
                    height: 8,
                    thickness: 1,
                    indent: 27,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
