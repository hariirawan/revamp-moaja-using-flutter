part of '_home.dart';

class HomePage extends StatelessWidget {
  List<String> dataDummy = ["1", "2", "3", "4", "5"];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          AppBarUI(),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  // SizedBox(height: 80),
                  advertisementList(),
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
                    margin:
                        EdgeInsets.symmetric(horizontal: Themes.marginDefault),
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
                    margin:
                        EdgeInsets.symmetric(horizontal: Themes.marginDefault),
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
                    margin:
                        EdgeInsets.symmetric(horizontal: Themes.marginDefault),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleView(
                          title: "Berita dan Hiburan",
                          subtitle: "Lihat Semua",
                        ),
                        SizedBox(height: 7),
                        Text(
                            "Berita terbaru membuat kamu akan jadi lebih update",
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Themes.marginDefault,
                  ),
                  news(context),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ))
        ],
      )),
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
                        Text("Ini 53 Tokoh Penerima Bintang Tan..."),
                        Container(
                            width: MediaQuery.of(context).size.width - 20 - 20,
                            margin: EdgeInsets.only(top: 6),
                            child: Text(
                              "Presiden Joko Widodo atau Jokowi enganugerahkan tanda jasa dan tanda kehormatan kepada 53 tokoh...",
                              maxLines: 2,
                              overflow: TextOverflow.clip,
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

  // Container(
  //               child: Column(children: [
  //             Container(
  //               height: 128,
  //               width: MediaQuery.of(context).size.width,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8),
  //                   image: DecorationImage(
  //                       image: AssetImage("assets/image/daily-needs.png"),
  //                       fit: BoxFit.cover)),
  //             ),
  //             SizedBox(
  //               height: Themes.marginDefault,
  //             ),
  //             Row(
  //               children: [
  //                 Text("Cuci Salju"),
  //                 Spacer(),
  //                 Text("Bintang"),
  //               ],
  //             ),
  //             SizedBox(
  //               height: Themes.marginDefault,
  //             ),
  //             Text(
  //                 "Cuci mobil kamu gak perlu pusing, pasti hemat dan dijamin bersih! Yuk cobain!"),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text("Rp.5000"),
  //                 Spacer(),
  //                 Container(
  //                   decoration: BoxDecoration(
  //                       color: Themes.green,
  //                       borderRadius: BorderRadius.circular(62)),
  //                   padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
  //                   child: Text(
  //                     "Pesan Sekarang",
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold, color: Colors.white),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Container(
  //                 margin: EdgeInsets.symmetric(vertical: 21),
  //                 child: Divider(
  //                   color: Colors.grey,
  //                   height: 1,
  //                 ))
  //           ])

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
                        Text("Cuci Salju"),
                        Spacer(),
                        Text("Bintang"),
                      ],
                    ),
                    SizedBox(
                      height: Themes.marginDefault,
                    ),
                    Text(
                        "Cuci mobil kamu gak perlu pusing, pasti hemat dan dijamin bersih! Yuk cobain!"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Rp.5000"),
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
                    left: index == 0
                        ? Themes.marginDefault
                        : Themes.marginDefault / 2,
                    right: index == dummyData.length - 1
                        ? Themes.marginDefault
                        : Themes.marginDefault / 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage(dummyData[index].image))),
              );
            }));
  }

  Widget advertisementList() {
    return SizedBox(
      height: 183,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataDummy.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 10,
                  right: dataDummy.length - 1 == index ? 20 : 10),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              height: 183,
              width: 335,
              child: Center(child: Text("#Makan Aja")),
            );
          }),
    );
  }
}
