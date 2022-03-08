import 'package:ajapp/constants/asset_path.dart';
import 'package:ajapp/views/global_components/k_cart_component.dart';
import 'package:ajapp/views/screens/drawer/component/drawer_content.dart';
import 'package:ajapp/views/screens/drawer/custom_drawer_screen.dart';
import 'package:ajapp/views/screens/home/home_screen.dart';
import 'package:ajapp/views/screens/search/search_screen.dart';
import 'package:ajapp/views/screens/settings/setting_screen.dart';
import 'package:ajapp/views/styles/b_style.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  final bool value;
  const BottomNavigationScreen({Key? key, required this.value})
      : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentTab = 1;
  final List<Widget> screens = const [
    SearchScreen(),
    HomeScreen(),
    SettingScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawerScreen(
          child: DrawerContent(),
        ),
        appBar: currentTab == 1
            ? AppBar(
                backgroundColor: KColor.white,
                leadingWidth: 58,
                leading: Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 0.0,
                          top: KSize.getHeight(context, 14),
                          bottom: 4,
                          right: 0),
                      child: Container(
                        margin:
                            EdgeInsets.only(left: KSize.getWidth(context, 18)),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: KColor.grey.withOpacity(0.4),
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: const Offset(
                                    0.0, 4.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(11),
                            color: KColor.primary,
                            image: const DecorationImage(
                                image: AssetImage(AssetPath.menu))),
                      ),
                    ),
                  );
                }),
                centerTitle: true,
                title: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          KCartComponent(
                            color: KColor.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                elevation: 0,
              )
            : null,
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: SizedBox(
              height: widget.value ? 40 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          setState(() {
                            currentScreen = const SearchScreen();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              currentTab == 0
                                  ? AssetPath.darksearch
                                  : AssetPath.search,
                              width: 25,
                              height: 22,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            currentTab == 0
                                ? Image.asset(
                                    AssetPath.bottomtab,
                                    alignment: Alignment.bottomCenter,
                                  )
                                : Image.asset(
                                    AssetPath.whitebottomtab,
                                    alignment: Alignment.bottomCenter,
                                  )
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          setState(() {
                            currentScreen = const HomeScreen();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              currentTab == 1
                                  ? AssetPath.darkhome
                                  : AssetPath.whitehome,
                              width: 25,
                              height: 22,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            currentTab == 1
                                ? Image.asset(AssetPath.bottomtab,
                                    alignment: Alignment.bottomCenter)
                                : Image.asset(AssetPath.whitebottomtab,
                                    alignment: Alignment.bottomCenter)
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 20,
                        onPressed: () {
                          setState(() {
                            currentScreen = const SettingScreen();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              currentTab == 2
                                  ? AssetPath.darksetting
                                  : AssetPath.setting,
                              width: 25,
                              height: 22,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            currentTab == 2
                                ? Image.asset(AssetPath.bottomtab,
                                    alignment: Alignment.bottomCenter)
                                : Image.asset(AssetPath.whitebottomtab,
                                    alignment: Alignment.bottomCenter)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
