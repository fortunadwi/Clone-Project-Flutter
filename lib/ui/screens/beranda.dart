import 'package:flutter/material.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/common/my_font_size.dart';
import 'package:gojek/ui/screens/widgets/custom_button_icon.dart';
import 'widgets/card_goclub.dart';
import 'widgets/card_info.dart';
import 'widgets/custom_card.dart';
import 'widgets/nav_button.dart';
import 'widgets/scroll_bush.dart';
import 'widgets/subtitle.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  var _scrollController = ScrollController();

  int balanceBalance = 0;

  bool isBrush = false;

  bool isCollapseNavBottom = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 0) {
        isBrush = true;
        setState(() {});
      } else {
        isBrush = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

    Widget balance() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              color: MyColors.blue, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    2,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      height: 16,
                      width: 4,
                      decoration: BoxDecoration(
                          color: (balanceBalance == index)
                              ? MyColors.white
                              : MyColors.softGrey,
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 90,
                width: 150,
                decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "IndoPay",
                          style: TextStyle(
                            color: MyColors.blackText,
                            fontSize: MyFontSize.large1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Saldo masih kosong",
                      style: TextStyle(
                        color: MyColors.blackText,
                        fontSize: MyFontSize.medium1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Klik buat isi",
                      style: TextStyle(
                        color: MyColors.green,
                        fontSize: MyFontSize.medium1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: CustomButtonIcon(
                  action: () {},
                  iconPath: "assets/images/ic_bayar.png",
                  text: "Bayar",
                  fontColor: MyColors.white,
                  fontSize: 13,
                  height: 23,
                  width: 23,
                  isBold: true,
                ),
              ),
              Expanded(
                child: CustomButtonIcon(
                  action: () {},
                  iconPath: "assets/images/ic_topup.png",
                  text: "Top Up",
                  fontColor: MyColors.white,
                  fontSize: 13,
                  height: 23,
                  width: 23,
                  isBold: true,
                ),
              ),
              Expanded(
                child: CustomButtonIcon(
                  action: () {},
                  iconPath: "assets/images/ic_eksplor.png",
                  text: "Eksplor",
                  fontColor: MyColors.white,
                  fontSize: 13,
                  height: 23,
                  width: 23,
                  isBold: true,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        ListView(
          controller: _scrollController,
          children: [
            SizedBox(height: 20),
            searchBox(),
            SizedBox(height: 20),
            balance(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CardGoClub(),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Subtitle(
                  iconPath: "assets/images/gopay.png",
                  iconText: "Gopay+",
                  subtitle: "Pake Gopay di Tokopedia",
                  caption:
                      "Belanja & nikmati beragam promo cashback istimewa hingga Rp 1.7 juta untuk-mu~"),
            ),
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  2,
                  (index) => CardInfo(
                    imageUrl:
                        "https://lelogama.go-jek.com/post_featured_image/header_blog_promo_ppkm_gopay.jpg",
                    title: "Hadiah dari IndoJek buat perjalananmu!",
                    caption:
                        "Bayar Jajanan dan Belanjaan Kamu Pakai Gopay dan Nikmati Beragam Cashback Istimewa",
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Subtitle(
                iconPath: "assets/images/ic_indoride.png",
                iconText: "IndoJek",
                subtitle: "Promo merdeka buat kamu",
                caption:
                    "Ada diskon dari IndoJek/IndoCar, paket hemat IndoSend Instant, dan diskon IndoPay di sini!",
                prefWidget: CustomCard(
                    onTap: () {},
                    padding: EdgeInsets.zero,
                    bgColor: MyColors.softGreen,
                    shadow: false,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("Lihat Semua",
                          style: TextStyle(
                              color: MyColors.darkGreen,
                              fontSize: MyFontSize.medium2,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
            ),
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    2,
                    (index) => CardInfo(
                          imageUrl:
                              "https://scontent.fcgk8-1.fna.fbcdn.net/v/t39.30808-6/240669728_1989291161235881_553831736362611766_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=a26aad&_nc_eui2=AeFjM3H8MSRmllJ1w5cNkcTDEkmH4oTAOegSSYfihMA56MxiakM4Jk8BfSbwPVb-5hYv4SE1Hhae9vQrfDRWIsoR&_nc_ohc=3g83OZMKQqoAX-cOiDs&_nc_zt=23&_nc_ht=scontent.fcgk8-1.fna&oh=00_AfBgAkfnwMh3j2466DLLDbr8nodr9VVHjTGUNAwHzpcg2w&oe=63C0002B",
                          title: "Bongkar rahasia penjualan barang murah",
                          caption:
                              "Nikmatin perjalanan aman dan hemat naik IndoJek/IndoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                        )),
              ),
            ),
            SizedBox(height: 120),
          ],
        ),
        if (isBrush)
          Align(alignment: Alignment.topCenter, child: ScrollBrush()),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dy < 0) {
                  isCollapseNavBottom = false;
                  setState(() {});
                }

                if (details.delta.dy > 0) {
                  isCollapseNavBottom = true;
                  setState(() {});
                }
              },
              child: NavBottom(
                isCollapse: isCollapseNavBottom,
              )),
        ),
      ],
    );
  }
}
