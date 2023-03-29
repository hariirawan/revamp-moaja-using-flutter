part of '_profile.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        SizedBox(height: 34),
        Container(
            margin: EdgeInsets.only(
                left: Themes.marginDefault,
                right: Themes.marginDefault,
                bottom: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/courier/foto-courier.png"))),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nunu",
                            style: Themes.fontMontserrat16Bold,
                          ),
                          Text(
                            "085295973444",
                            style: Themes.fontOpenSans12,
                          ),
                          Text(
                            "nunu@gmail.com",
                            style: Themes.fontOpenSans12,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              SizedBox(
                                  height: 19,
                                  width: 19,
                                  child: Image.asset('assets/icons/crown.png')),
                              SizedBox(
                                width: 11,
                              ),
                              Text(
                                "Level Dewa",
                                style: Themes.fontOpenSans12Bold
                                    .copyWith(color: Color(0xFFFFA73B)),
                              )
                            ],
                          )
                        ])
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (context) => EditProfile())),
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Icon(Icons.edit)),
                )
              ],
            )),
        Divider(),
        Column(
            children: List.generate(menuProfile.length, (index) {
          return buildInkWell(context,
              title: menuProfile[index].name,
              icon: menuProfile[index].image,
              url: menuProfile[index].url);
        })),
        SizedBox(height: 77),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Button(
              label: Center(
                  child: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              )),
              btnColor: Themes.red,
            ))
      ]),
    );
  }

  InkWell buildInkWell(BuildContext context,
      {Widget navigate,
      String title,
      String itemCount,
      String icon,
      String url}) {
    return InkWell(
        onTap: () {
          switch (url) {
            case '/my-review':
              return Navigator.push(context,
                  MaterialPageRoute<dynamic>(builder: (context) => Review()));
            case '/review-favorite':
              return Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => ReviewFavorite()));
            case '/faq':
              return Navigator.push(context,
                  MaterialPageRoute<dynamic>(builder: (context) => FAQ()));

            case '/terms-of-service':
              return Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => PrivacyPolice(
                            title: "Ketentuan Layanan",
                            subTitle: "Ketentuan Layanan MOaja",
                          )));
            case '/invite':
              return Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => InviteFriends()));
            case '/privacy-police':
              return Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => PrivacyPolice(
                            title: "Kebijakan Privasi",
                            subTitle: "Kebijakan Privasi MOaja",
                          )));
            case '/help':
              return _modalBantuan(context);

            default:
              return null;
          }
        },
        child: ItemList(
          title: title,
          itemCount: itemCount,
          icon: icon,
        ));
  }

  _launchPhone() async {
    const url = "tel:+1 555 010 999";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail() async {
    const url = "mailto:smith@example.org?subject=News&body=New%20plugin";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _modalBantuan(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return Container(
            height: MediaQuery.of(context)?.size.height * 0.3,
            child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  child: Column(children: [
                    Container(
                        height: 4.04,
                        width: 60.58,
                        margin: EdgeInsets.only(top: 10, bottom: 39),
                        decoration: BoxDecoration(
                            color: Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(40))),
                    InkWell(
                      onTap: () => _launchPhone(),
                      child: ListTile(
                        leading: Image.asset(
                            'assets/icons/moaja-profil/logo-telpon.png'),
                        title: Text(
                          "Ponsel",
                          style: Themes.fontOpenSans.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () => _launchEmail(),
                        child: ListTile(
                          leading: Image.asset(
                              'assets/icons/moaja-profil/logo-email.png'),
                          title: Text("Email",
                              style: Themes.fontOpenSans.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                        )),
                    ListTile(
                      leading:
                          Image.asset('assets/icons/moaja-profil/logo-wa.png'),
                      title: Text("WhatsApp",
                          style: Themes.fontOpenSans.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    )
                  ]),
                )),
          );
        });
    return null;
  }
}

class ItemList extends StatelessWidget {
  final String title;
  final String itemCount;
  final String icon;

  ItemList({@required this.title, this.itemCount, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 16,
              child: Column(children: [
                Image.asset(icon),
                Divider(
                  color: Colors.transparent,
                )
              ]),
            ),
            SizedBox(width: 22),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: Themes.fontMontserrat14600,
                            ),
                            itemCount == null ? SizedBox() : Text("(12)")
                          ]),
                    ),
                    Divider()
                  ]),
            )
          ],
        ));
  }
}
