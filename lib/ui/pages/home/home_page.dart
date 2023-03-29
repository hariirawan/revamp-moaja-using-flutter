part of '_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> dataDummy = ["1", "2", "3", "4", "5"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context)?.size.width;

    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        BannerHead(
          banner: 'assets/images/banner/banner-green.png',
          children: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 22.83,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Halo, Lutfi!",
                            style: Themes.fontMontserrat
                                .copyWith(fontSize: 22, color: Colors.white),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Row(children: [
                                Text(
                                  "Alamat pengiriman",
                                  style: Themes.fontOpenSans.copyWith(
                                      fontSize: 10, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Jl. Kuningan Barat",
                                  style: Themes.fontOpenSans.copyWith(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ]))
                        ],
                      ),
                      Spacer(),
                      Stack(children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.3)),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    color: Color(0xFFC41622),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text("9+",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8))))),
                      ])
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'MO cari apa?',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        prefixIcon: Icon(Icons.search),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 11),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 1),
                            borderRadius: BorderRadius.circular(32.0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 1),
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                BannerSlide(),
              ])),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 25),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: menus
                  .map((e) => GestureDetector(
                        onTap: () {
                          if (e.name == "Makanan\nMinuman") {
                            Navigator.pushNamed(context, '/shop');
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 75,
                              height: 95,
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        height: 90,
                                        width: 71,
                                        decoration: BoxDecoration(
                                            color: e.color,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          padding: EdgeInsets.only(top: 8),
                                          alignment: Alignment.topCenter,
                                          child: Text(e.name,
                                              style: Themes.fontMontserrat
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 10)),
                                        ),
                                      )),
                                  Positioned(
                                      bottom: -10,
                                      left: 0,
                                      child: Container(
                                          width: 70,
                                          height: 74,
                                          margin: EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(e.icon))))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList()),
        ),

        Container(
            height: 120,
            width: width - 20 * 2,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 5),
                      blurRadius: 10,
                      spreadRadius: 5,
                      color: Color(0xFFE5E5E5))
                ],
                image: DecorationImage(
                    image: AssetImage('assets/images/banner/food.png'),
                    fit: BoxFit.cover),
                color: Colors.green,
                borderRadius: BorderRadius.circular(6)),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10.98),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0)
                      ]),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "FoodCourt",
                        style:
                            Themes.fontMontserrat.copyWith(color: Colors.white),
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 230,
                              margin: EdgeInsets.only(top: 10.41),
                              child: Text(
                                  "Kamu bisa pesen banyak dari banyak Merchant dengan satu ongkir",
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Themes.fontOpenSans
                                      .copyWith(color: Colors.white)),
                            ),
                            Spacer(),
                            Align(
                                child: Button(
                              label: Text(
                                "Cobain",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              btnColor: Themes.mainColors,
                              paddingH: 15,
                              paddingV: 4,
                            ))
                          ]),
                    ]))),
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
          child: TitleView(
            title: "Sekitar Anda",
            subtitle: "Lihat Semua",
            desc: "Temukan tempat belanja menarik di sekitar Anda",
          ),
        ),
        SizedBox(height: Themes.marginDefault),
        listRecomendation(),
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
          child: TitleView(
            title: "Kebutuhan Harian",
            subtitle: "Lihat Semua",
            desc: "Temukan tempat belanja menarik di sekitar Anda",
          ),
        ),
        SizedBox(
          height: Themes.marginDefault,
        ),
        dailyNeeds(context),
        SizedBox(
          height: Themes.marginDefault,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
          child: TitleView(
            title: "Berita dan Hiburan",
            subtitle: "Lihat Semua",
            desc: "Berita terbaru membuat kamu akan jadi lebih update",
          ),
        ),
        SizedBox(
          height: Themes.marginDefault,
        ),
        // news(context),
        HomeNews(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
          child: TitleView(
            title: "Baru Bergabung",
            subtitle: "Lihat Semua",
            desc: "Yuk cobain menu dan layanan dari merchant terbaru kita",
          ),
        ),
        SizedBox(
          height: Themes.marginDefault,
        ),
        Column(
            children: dataDummy
                .map((e) => listMerchent(context, e, dataDummy))
                .toList()),
        SizedBox(
          height: 64,
        ),
      ],
    );
  }

  Widget listMerchent(BuildContext context, String e, List dataDummy) {
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

  Widget news(BuildContext context) {
    List<int> data = [1, 2, 3, 4, 5];

    return Container(
        height: 210,
        width: MediaQuery.of(context)?.size.width - 20 - 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return CardNews();
          },
        ));
  }

  Widget dailyNeeds(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
        child: Column(
          children: itemDummy
              .map(
                (e) => CardNeeds(
                    image: e.image,
                    title: e.name,
                    desc: e.desc,
                    rate: e.rate,
                    promo: e.promo),
              )
              .toList(),
        ));
  }

  Widget listRecomendation() {
    return SizedBox(
        height: 183,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return CardRecomendation(
                index: index,
              );
            }));
  }
}
