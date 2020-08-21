part of '_widget.dart';

class CardBestRecomendation extends StatelessWidget {
  CardBestRecomendation({this.image, this.title, this.rating, this.subTitle});

  final String image;
  final String title;
  final double rating;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      image: AssetImage(this.image), fit: BoxFit.cover)),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(this.title, style: TextStyle(fontSize: 14)),
                SizedBox(height: 10),
                RatingStars(
                  voteAverage: 4,
                  starSize: 10,
                ),
                SizedBox(height: 5),
                Container(
                    width: 150,
                    child: Text(
                      this.subTitle,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 12),
                    )),
                Text("0.3 Km", style: TextStyle(fontSize: 10)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
