part of '_shop.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  ScrollController _scrollController = new ScrollController();

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
  bool upArrowFloating = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(scrollPage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollPage() {
    // var valueScroll = _scrollController.offset.round();
    if (upArrowFloating == false) {
      if (_scrollController.offset > 30) {
        setState(() {
          upArrowFloating = true;
        });
      }
    } else {
      if (_scrollController.offset < 30) {
        setState(() {
          upArrowFloating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    print(upArrowFloating);
    return SafeArea(
        top: false,
        child: Stack(children: [
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.all(0.0),
            children: [
              BannerHead(
                  banner: 'assets/images/merah 1.png',
                  children: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: Themes.marginDefault,
                                right: Themes.marginDefault),
                            padding: EdgeInsets.only(
                                top: 22.83 / 2, bottom: 22.83 / 2),
                            child: Image.asset(
                              'assets/icons/Path.png',
                              width: 10,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(
                              left: Themes.marginDefault,
                              right: Themes.marginDefault,
                              top: 16.49),
                          child: Row(
                            children: [
                              Text("Alamat antar",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(width: 10),
                              Text("Jl. Kuningan Barat 1...",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.only(
                            left: Themes.marginDefault,
                            right: Themes.marginDefault,
                            top: 26.48,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'MO cari apa?',
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              prefixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 11),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(32.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 1),
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      BannerSlide(),
                    ],
                  )),
              Container(
                margin:
                    EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 30),
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
                margin:
                    EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
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
                margin:
                    EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
                child: TitleView(
                  title: "MObelanja Kekinian",
                  subtitle: "Lihat Semua",
                  colorSub: Colors.redAccent,
                  desc:
                      "Belanjaan kekinian yang gak bakal bikin kamu ketinggalan",
                ),
              ),
              shoppingRecomendations(context),

              //List Kebutuhan Harian
              Container(
                margin:
                    EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
                child: TitleView(
                  title: "Kebutuhan Harian",
                  desc: "Layanan dan produk yang mungkin Anda butuhkan",
                ),
              ),
              dailyNeeds(context),
            ],
          ),
          AnimatedPositioned(
              bottom: upArrowFloating == true ? 32 : -150,
              left: width / 2 - 160 / 2,
              duration: Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-order');
                },
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
                        SvgPicture.asset('assets/icons/svg/keranjang-on.svg',
                            semanticsLabel: 'Acme Logo'),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
              )),
        ]));
  }

  Widget shoppingRecomendations(BuildContext context) {
    return Container(
        height: 210,
        width: MediaQuery.of(context).size.width - 20 - 20,
        child: Carousel(
            children: CardNews(
          image: "assets/images/bg_card.png",
        )));
  }

  Widget bestRecomendation(BuildContext context, String e, List dataDummy) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
      child: Column(
        children: [
          CardBestRecomendation(
            image: 'assets/images/merchant.png',
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
                                image: AssetImage('assets/images/banner.png'),
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
