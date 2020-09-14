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
                Icon(Icons.edit)
              ],
            )),
        Divider(),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/my-review');
          },
          child: ItemList(
            title: "Ulasanku",
            itemCount: "12",
          ),
        ),
        ItemList(
          title: "Ulasan Favorit",
          itemCount: "12",
        ),
        ItemList(
          title: "Ajak Teman Pakai MoAja",
        ),
        ItemList(
          title: "Kebijakan Privasi",
        ),
        ItemList(
          title: "Ketentuan Layanan",
        ),
        ItemList(
          title: "Bantuan",
        ),
        ItemList(
          title: "FAQ",
        ),
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
}

class ItemList extends StatelessWidget {
  final String title;
  final String itemCount;
  final Icon icon;

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
              // padding: EdgeInsets.symmetric(vertical: 19),
              child: Column(children: [
                Icon(Icons.chat_bubble),
                Divider(
                  color: Colors.transparent,
                )
              ]),
            ),
            SizedBox(width: 22),
            Container(
              width: MediaQuery.of(context).size.width -
                  (Themes.marginDefault * 2 + 38),
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
