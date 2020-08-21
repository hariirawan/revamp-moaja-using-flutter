part of '_widget.dart';

class CardNews extends StatelessWidget {
  final String image;

  CardNews({this.image = "assets/image/jokowi.png"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135,
            width: MediaQuery.of(context).size.width - 20 - 20,
            margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
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
  }
}
