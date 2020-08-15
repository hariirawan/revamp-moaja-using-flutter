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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
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
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            advertisementList(context),
            SizedBox(height: 30),
            Container(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: menus
                      .map((e) => Column(
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
                          ))
                      .toList()),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleView(
                    title: "Sekitar Anda",
                    subtitle: "Lihat Semua",
                  ),
                  SizedBox(height: 7),
                  Text("Temukan tempat belanja menarik di sekitar Anda",
                      style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            SizedBox(height: Themes.marginDefault),
            recomendedList(),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleView(
                    title: "Kebutuhan Harian",
                    subtitle: "Lihat Semua",
                  ),
                  SizedBox(height: 7),
                  Text("Temukan tempat belanja menarik di sekitar Anda",
                      style: TextStyle(fontSize: 10)),
                ],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleView(
                    title: "Berita dan Hiburan",
                    subtitle: "Lihat Semua",
                  ),
                  SizedBox(height: 7),
                  Text("Berita terbaru membuat kamu akan jadi lebih update",
                      style: TextStyle(fontSize: 10)),
                ],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleView(
                    title: "Baru Bergabung",
                    subtitle: "Lihat Semua",
                  ),
                  SizedBox(height: 7),
                  Text("Yuk cobain menu dan layanan dari merchant terbaru kita",
                      style: TextStyle(fontSize: 10)),
                ],
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 94,
                width: 94,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage("assets/image/merchant.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(width: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NOS Car Wash", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  RatingStars(
                    voteAverage: 4,
                    starSize: 10,
                  ),
                  SizedBox(height: 5),
                  Container(
                      width: 150,
                      child: Text(
                        "Jl. Bangka Raya No. 5c Kemang, Jakarta Selatan",
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 12),
                      )),
                  Text("0.3 Km", style: TextStyle(fontSize: 10)),
                ],
              )
            ],
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
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 135,
                    width: MediaQuery.of(context).size.width - 20 - 20,
                    margin:
                        EdgeInsets.symmetric(horizontal: Themes.marginDefault),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage("assets/image/jokowi.png"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Themes.marginDefault,
                        right: Themes.marginDefault,
                        top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ini 53 Tokoh Penerima Bintang Tan...",
                          style: Themes.fontBold
                              .copyWith(fontSize: 12, letterSpacing: 0.2),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 20 - 20,
                            margin: EdgeInsets.only(top: 6),
                            child: Text(
                              "Presiden Joko Widodo atau Jokowi enganugerahkan tanda jasa dan tanda kehormatan kepada 53 tokoh...",
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: Themes.fontNormal,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  Widget dailyNeeds(BuildContext context) {
    List<int> data = [1, 2, 3, 4, 5];

    return Container(
        margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
        child: Column(
          children: data
              .map((e) => Column(children: [
                    Container(
                      height: 128,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage("assets/image/daily-needs.png"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: Themes.marginDefault,
                    ),
                    Row(
                      children: [
                        Text(
                          "Cuci Salju",
                          style: Themes.fontBold,
                        ),
                        Spacer(),
                        RatingStars(
                          voteAverage: 3,
                          color: Color(0xFFF9DE58),
                          fontColor: Colors.black,
                          starSize: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Cuci mobil kamu gak perlu pusing, pasti hemat dan dijamin bersih! Yuk cobain!",
                      style: Themes.fontNormal,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rp.5000",
                            style: Themes.fontBold,
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                color: Themes.green,
                                borderRadius: BorderRadius.circular(62)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Text(
                              "Pesan Sekarang",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 21),
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                        ))
                  ]))
              .toList(),
        ));
  }

  Widget recomendedList() {
    return SizedBox(
        height: 183,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                height: 183,
                margin: EdgeInsets.only(
                    left: index == 0 ? Themes.marginDefault : 5,
                    right: index == dummyData.length - 1
                        ? Themes.marginDefault
                        : 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage(dummyData[index].image))),
                child: Container(
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
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 9, right: 9, bottom: 9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingStars(
                          voteAverage: 20,
                        ),
                        Text(
                          "Bakmi JM",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 12,
                            ),
                            Text("0.3 Km",
                                style:
                                    TextStyle(fontSize: 8, color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget advertisementList(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataDummy.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  right: dataDummy.length - 1 == index ? 20 : 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/banner.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              height: 183,
              width: width - Themes.marginDefault - Themes.marginDefault,
              child: Center(child: Text("#Makan Aja")),
            );
          }),
    );
  }
}
