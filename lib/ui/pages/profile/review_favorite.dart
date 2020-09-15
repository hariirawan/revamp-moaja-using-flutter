part of '_profile.dart';

class ReviewFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
                color: Color(0xFF4D4D4D),
              ),
              onPressed: () => Navigator.pop(context)),
          centerTitle: true,
          title: Text(
            "Ulasan Favorit",
            style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: index == 0 ? 20 : 0),
                    child: CardReviewFavorite(),
                  );
                },
              ),
            )
          ],
        ));
  }
}

class CardReviewFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: Themes.marginDefault, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15 * 0.4,
                  spreadRadius: 1,
                  offset: Offset(0, 0),
                  color: Color.fromRGBO(0, 0, 0, 0.15))
            ]),
        child: Column(
          children: [
            Container(
              height: 447 - 197.0,
              width: width - Themes.marginDefault * 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/recommended1.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.94, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 32.17,
                              width: 32.17,
                              margin: EdgeInsets.only(right: 6.96),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/courier/foto-courier.png'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nunu",
                                  style: Themes.fontMontserrat12600,
                                ),
                                Text(
                                  "Today 1:02 PM",
                                  style: Themes.fontMontserrat10,
                                )
                              ],
                            )
                          ],
                        ),
                        Row(children: [
                          Icon(Icons.favorite, color: Themes.red),
                          SizedBox(width: 18.33),
                          Icon(
                            Icons.mode_comment,
                            color: Colors.grey[400],
                          ),
                          SizedBox(width: 18.33),
                          Icon(
                            Icons.share,
                            color: Colors.grey[400],
                          ),
                        ])
                      ],
                    ),
                    SizedBox(height: 20.83),
                    Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            "Bakmi Komplit",
                            style: Themes.fontMontserrat14600,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Enak banget, gatau lagi, mo beli lagi tapi takut beli mulu. tapi kalo dibayarin kamu",
                            maxLines: 3,
                            style: Themes.fontOpenSans12,
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("66 Likes", style: Themes.fontOpenSans8),
                              SizedBox(width: 6.28),
                              Text("60 Komentar", style: Themes.fontOpenSans8),
                            ],
                          ),
                        ]))
                  ],
                ))
          ],
        ));
  }
}
