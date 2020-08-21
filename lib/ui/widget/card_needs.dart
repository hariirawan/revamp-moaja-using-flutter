part of '_widget.dart';

class CardNeeds extends StatelessWidget {
  final String image;
  final Color btnColor;

  CardNeeds(
      {this.image = "assets/image/daily-needs.png",
      this.btnColor = Themes.mainColors});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 128,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
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
