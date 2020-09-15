part of '_profile.dart';

class PrivacyPolice extends StatelessWidget {
  final String title;
  final String subTitle;
  PrivacyPolice({@required this.title, @required this.subTitle});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
            title,
            style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            BannerHead(
              banner: 'assets/images/banner/banner-green.png',
              height: 150,
            ),
            Expanded(
              child: ListView(
                children: [
                  Center(
                      child: Text(
                    subTitle,
                    style: Themes.fontMontserrat
                        .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                  )),
                  SizedBox(height: 22),
                  Column(
                    children: List.generate(
                      privacyPolice.length,
                      (index) => Container(
                        width: width - Themes.marginDefault * 2,
                        margin: EdgeInsets.only(
                            left: Themes.marginDefault,
                            right: Themes.marginDefault,
                            top: index == 0 ? 0 : 5,
                            bottom: privacyPolice.length - 1 == index ? 10 : 5),
                        child: Text(privacyPolice[index].desc),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
