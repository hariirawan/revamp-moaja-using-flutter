part of '_widget.dart';

class CardRecomendation extends StatelessWidget {
  final double height;
  final double width;
  final ModelRecomended data;
  final int index;

  CardRecomendation(
      {this.data, this.height = 140, this.width = 183, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 183,
      margin: EdgeInsets.only(
          left: index == 0 ? Themes.marginDefault : 5,
          right: index == dummyData.length - 1 ? Themes.marginDefault : 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(image: AssetImage(dummyData[index].image))),
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
          padding: const EdgeInsets.only(left: 9, right: 9, bottom: 9),
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
                      style: TextStyle(fontSize: 8, color: Colors.white))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
