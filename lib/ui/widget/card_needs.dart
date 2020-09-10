part of '_widget.dart';

class CardNeeds extends StatelessWidget {
  final String image;
  final String title;
  final double rate;
  final String desc;
  final Color btnColor;
  final bool promo;

  CardNeeds(
      {this.image = "assets/images/daily-needs.png",
      this.title = "Makaroni",
      this.rate = 3.0,
      this.desc =
          "Makaroni pedes. enak banget deh, gak bakalan relate pokoknya, siap-siap meninggal..",
      this.btnColor = Themes.mainColors,
      this.promo});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: 131,
          child: Stack(children: [
            Positioned(
                bottom: 0,
                child: Stack(children: [
                  Container(
                    height: 128,
                    width: MediaQuery.of(context).size.width -
                        Themes.marginDefault * 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover)),
                  ),
                  promo == false
                      ? SizedBox()
                      : Container(
                          height: 128,
                          width: MediaQuery.of(context).size.width -
                              Themes.marginDefault * 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Rectangle 114.png'),
                                  fit: BoxFit.cover)),
                        ),
                ])),
            Positioned(
              top: 0,
              left: 12,
              child: promo == false
                  ? SizedBox()
                  : Image.asset(
                      'assets/icons/promo-flag.png',
                      width: 31.145,
                    ),
            ),
          ])),
      SizedBox(
        height: Themes.marginDefault,
      ),
      Row(
        children: [
          Text(
            title,
            style: Themes.fontMontserrat,
          ),
          Spacer(),
          RatingStars(
            voteAverage: rate,
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
        desc,
        style: Themes.fontOpenSans,
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rp.5000",
              style: Themes.fontMontserrat,
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: btnColor, borderRadius: BorderRadius.circular(62)),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Text(
                "Pesan Sekarang",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
    ]);
  }
}
