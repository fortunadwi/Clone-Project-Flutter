import 'package:flutter/material.dart';
import 'package:gojek/ui/screens/beranda.dart';
import 'package:gojek/ui/screens/promo.dart';

import '../../common/my_colors.dart';
import '../../common/my_font_size.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _scrollController = ScrollController();

  List<bool> tabBarBadgeList = [
    false,
    false,
    false,
    true,
  ];

  List tabBarList = [
    "Beranda",
    "Promo",
    "Pesanan",
    "Chat",
  ];

  List selectedBody = [
    Beranda(),
    PromoPage(),
    Container(),
    Container(),
  ];

  int tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.green,
        title: tabBar(),
      ),
      body: selectedBody[tabBarIndex],
      // body: ,
    );
  }

  Widget tabBarItem(int index) {
    return Expanded(
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.all(5),
              height: double.infinity,
              decoration: BoxDecoration(
                  color: (tabBarIndex == index)
                      ? MyColors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(100)),
              child: InkWell(
                onTap: () {
                  setState(() {
                    tabBarIndex = index;
                  });
                },
                child: Center(
                  child: Text(
                    tabBarList[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: (tabBarIndex == index)
                            ? MyColors.darkGreen
                            : MyColors.white,
                        fontSize: MyFontSize.medium1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          if (tabBarBadgeList[index])
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: MyColors.red,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1.5, color: MyColors.white)),
                child: Center(
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget tabBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.darkGreen, borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          tabBarItem(0),
          tabBarItem(1),
          tabBarItem(2),
          tabBarItem(3),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: MyColors.whiteL2,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1.5, color: MyColors.softGrey)),
                child: Row(
                  children: [
                    Icon(Icons.search, color: MyColors.blackText, size: 40),
                    SizedBox(width: 10),
                    Expanded(
                        child: Text(
                      "Cari layanan, makanan, & tujuan",
                      style: TextStyle(
                          color: MyColors.grey, fontSize: MyFontSize.medium2),
                    ))
                  ],
                )),
          ),
          SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              "assets/images/foto.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
