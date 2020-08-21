part of '_shop.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<String> data = [
    "Makanan",
    "Minuman",
    "Buah",
    "Sayur",
    "Salad",
    "Jus",
    "Sop Buah",
    "Jasjus"
  ];

  final controller = PageController(
    initialPage: 1,
  );

  int initialState = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double getDiameter(BuildContext context) =>
        MediaQuery.of(context).size.width * 2 / 3;

    return Scaffold(
        body: Stack(children: [
      ListView(
        children: [
          Container(
            height: 390,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/image/banner.png"),
                                fit: BoxFit.cover)),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 20),
                            child: Container(
                              height: 280,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.white.withOpacity(1),
                                      Color(0xFF9E141D).withOpacity(.7),
                                      Color(0xFF9E141D).withOpacity(.8),
                                      Color(0xFFC41622).withOpacity(1),
                                    ]),
                              ),
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Themes.marginDefault),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.48),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child:
                                            Image.asset('assets/icon_back.png'),
                                      ),
                                      SizedBox(height: 25.49),
                                      Row(
                                        children: [
                                          Text("Alamat antar",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(width: 10),
                                          Text("Jl. Kuningan Barat 1...",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'MO cari apa?',
                                          filled: true,
                                          fillColor: Colors.white,
                                          prefixIcon: Icon(Icons.search),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              20.0, 15.0, 20.0, 15.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0)),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                        // margin: EdgeInsets.only(top: 30),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: bannerSlide(context))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 28.33, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Bag.png'),
                SizedBox(width: 5),
                Text(
                  "MO",
                  style: Themes.fontLogo.copyWith(
                      fontSize: 24,
                      color: Themes.red,
                      fontWeight: FontWeight.bold),
                ),
                Text("beli apa?",
                    style: Themes.fontLogo
                        .copyWith(fontSize: 24, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            height: 25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, e) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        initialState = e;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: e == 0 ? Themes.marginDefault : 0, right: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            data[e],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: initialState == e
                                    ? Themes.red
                                    : Color(0xFFC5CFD6)),
                          )),
                          initialState == e
                              ? Container(
                                  width: 25,
                                  height: 2,
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      color: Themes.red,
                                      borderRadius: BorderRadius.circular(100)),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  );
                }),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 30),
            child: TitleView(
              title: "Sekitar Anda",
              subtitle: "Lihat Semua",
              colorSub: Colors.redAccent,
              desc: "Temukan tempat belanja menarik di sekitar Anda",
            ),
          ),
          listRecomendation(),

          //List Recomendasi Terbaik
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
            child: TitleView(
              title: "Rekomendasi Terbaik",
              desc: "Boleh dicoba Merchant pilihan kami, jaminan puas!",
            ),
          ),
          Column(
              children: dummyData
                  .sublist(0, 3)
                  .map((e) => bestRecomendation(context, e.name, dummyData))
                  .toList()),

          //List Belanja Kekinian
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
            child: TitleView(
              title: "MObelanja Kekinian",
              subtitle: "Lihat Semua",
              colorSub: Colors.redAccent,
              desc: "Belanjaan kekinian yang gak bakal bikin kamu ketinggalan",
            ),
          ),
          shoppingRecomendations(context),

          //List Kebutuhan Harian
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
            child: TitleView(
              title: "Kebutuhan Harian",
              desc: "Layanan dan produk yang mungkin Anda butuhkan",
            ),
          ),
          dailyNeeds(context),
        ],
      ),
      Positioned(
          left: getDiameter(context) / 2,
          bottom: 20,
          child: Container(
            width: 160,
            height: 56,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(197, 23, 35, 0.4),
                      blurRadius: 15,
                      offset: Offset(4, 4))
                ],
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(225, 26, 40, 0.8),
                  Color.fromRGBO(197, 22, 34, 0.8)
                ], begin: Alignment.topCenter, end: Alignment.topCenter),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50)),
            child: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 9.8),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3 Items",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Rp. 30000",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ]),
                ],
              ),
            ),
          )),
    ]));
  }

  Widget shoppingRecomendations(BuildContext context) {
    List<int> data = [1, 2, 3, 4, 5];

    return Container(
        height: 210,
        width: MediaQuery.of(context).size.width - 20 - 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return CardNews(
              image: "assets/image/bg_card.png",
            );
          },
        ));
  }

  Widget bestRecomendation(BuildContext context, String e, List dataDummy) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
      child: Column(
        children: [
          CardBestRecomendation(
            image: 'assets/image/merchant.png',
            title: "NOS Car Wash",
            subTitle: "Jl. Bangka Raya No. 5c Kemang, Jakarta Selatan",
          ),
          (dataDummy.length).toString() == e
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                    color: Colors.grey,
                    height: 1,
                  ))
        ],
      ),
    );
  }

  Widget listRecomendation() {
    return SizedBox(
        height: 183,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => ItemList()),
                    );
                  },
                  child: CardRecomendation(
                    index: index,
                  ));
            }));
  }

  Widget dailyNeeds(BuildContext context) {
    List<int> data = [1, 2, 3, 4, 5];

    return Container(
        margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
        child: Column(
          children: data
              .map((e) => CardNeeds(
                    btnColor: Themes.red,
                  ))
              .toList(),
        ));
  }

  Widget bannerSlide(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(children: [
      SizedBox(
          height: 150,
          child: PageView(
              pageSnapping: true,
              controller: controller,
              children: List.generate(
                  4,
                  (index) => Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/banner.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                        height: 183,
                        width:
                            width - Themes.marginDefault - Themes.marginDefault,
                        child: Center(child: Text("#Makan Aja")),
                      )).toList())),
      SizedBox(
        height: 15,
      ),
      Container(
        child: SmoothPageIndicator(
          controller: controller,
          count: 4,
          effect: WormEffect(
              dotWidth: 5,
              dotHeight: 5,
              dotColor: Color(0xFFFBE2E3),
              activeDotColor: Color(0xFFC41622)),
        ),
      )
    ]);
  }
}
