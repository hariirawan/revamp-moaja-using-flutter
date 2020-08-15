part of '_home.dart';

class BannerSlid extends StatefulWidget {
  @override
  _BannerSlidState createState() => _BannerSlidState();
}

class _BannerSlidState extends State<BannerSlid> {
  final controller = PageController(
    initialPage: 1,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(children: [
      SizedBox(
          height: 150,
          // width: width,
          child: PageView(
              pageSnapping: true,
              controller: controller,
              children: List.generate(
                  4,
                  (index) => Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/banner.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                        height: 183,
                        width:
                            width - Themes.marginDefault - Themes.marginDefault,
                        child: Center(child: Text("#Makan Aja")),
                      )).toList())),
      SizedBox(
        height: 15,
      ),
      Container(
        child: SmoothPageIndicator(
          controller: controller,
          count: 4,
          effect: WormEffect(
              dotWidth: 5,
              dotHeight: 5,
              dotColor: Color(0xFFDFF3EC),
              activeDotColor: Themes.green),
        ),
      )
    ]);
  }
}
