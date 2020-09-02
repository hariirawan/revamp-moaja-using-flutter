part of '_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> dataDummy = ["1", "2", "3", "4", "5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Padding(
            padding: EdgeInsets.only(
                left: Themes.marginDefault,
                right: Themes.marginDefault,
                bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Halo, Nunu',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          letterSpacing: 0.27,
                        ),
                      ),
                      Text(
                        'Alamat pengiriman, Jl. Kuningan Barat',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFEFEF),
                          borderRadius: BorderRadius.circular(35)),
                      child: Icon(
                        Icons.notifications,
                        color: Color(0xFFF14343),
                        size: 18,
                      ),
                    ),
                    Positioned(
                        top: 0.1,
                        right: 3.0,
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red),
                          child: Center(
                            child: Text("9+",
                                style: TextStyle(
                                    fontSize: 8, color: Colors.white)),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            BannerSlide(),
            SizedBox(height: 30),
            Container(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: menus
                      .map((e) => GestureDetector(
                            onTap: () {
                              if (e.name == "MObelanja") {
                                Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          ShopPage()),
                                );
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 8),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(e.icon)))),
                                Text(
                                  e.name,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ))
                      .toList()),
            ),
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
            news(context),
            SizedBox(
              height: Themes.marginDefault,
            ),
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
        ));
  }

  Widget listMerchent(BuildContext context, String e, List dataDummy) {
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

  Widget news(BuildContext context) {
    List<int> data = [1, 2, 3, 4, 5];

    return Container(
        height: 210,
        width: MediaQuery.of(context).size.width - 20 - 20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return CardNews();
          },
        ));
  }

  Widget dailyNeeds(BuildContext context) {
    List<int> data = [1, 2, 3, 4, 5];

    return Container(
        margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
        child: Column(
          children: data.map((e) => CardNeeds()).toList(),
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
