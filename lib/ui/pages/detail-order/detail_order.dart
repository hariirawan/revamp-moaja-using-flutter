part of '_detail_order.dart';

class DetailOrder extends StatefulWidget {
  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder>
    with SingleTickerProviderStateMixin {
  int indexTab = 0;

  TabBar tabBar = TabBar(
      unselectedLabelColor: Themes.red,
      indicator: BoxDecoration(
          color: Themes.red, borderRadius: BorderRadius.circular(50)),
      tabs: [
        Tab(
          text: "Dianterin",
        ),
        Tab(
          text: "Ambil Sendiri",
        )
      ]);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(indexTab);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              "Detail Pesanan",
              style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 16),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(tabBar.preferredSize.height),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Themes.redAccent,
                ),
                child: tabBar,
              ),
            )),
        body: TabBarView(children: [
          TabIsDelivered(),
          Icon(Icons.verified_user),
        ]),
      ),
    );
  }
}

class TabIsDelivered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Themes.marginDefault,
                left: Themes.marginDefault,
                right: Themes.marginDefault),
            width: MediaQuery.of(context).size.width - Themes.marginDefault * 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.72, vertical: 11),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lokasi Anda saat ini"),
                      SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on),
                          Container(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                  "Jl. Kuningan Barat No 1, Mampang Prapatan")),
                          Spacer(),
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ],
                  )),
              TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.edit),
                      hintText: "berikan catatan lokasi",
                      hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
                      filled: true,
                      fillColor: Color(0xFFF9F9F9),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(borderSide: BorderSide.none))),
              SizedBox(height: 30),
              ListItem(),
              SizedBox(height: 30),
              DetailItem(),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width -
                    Themes.marginDefault * 2,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xFF30BB09))),
                child: Center(
                    child: Text(
                  "TAHUNBARU21",
                  style: TextStyle(color: Color(0xFF30BB09)),
                )),
              ),
              SizedBox(height: 120)
            ]),
          )
        ],
      ),
      Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 5,
                  offset: Offset(0, 5),
                  spreadRadius: 5)
            ]),
            child: Button(
              borderRadius: 4,
              btnColor: Themes.red,
              paddingV: 13,
              label: Center(
                  child: Text(
                "Pesan",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
            ),
          ))
    ]);
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Daftar Pesanan"),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 16),
          child: generateDashedDivider(
              MediaQuery.of(context).size.width - 2 * Themes.marginDefault),
        ),
        SizedBox(
          height: 20,
        ),
        TitleView(
          title: "Bakmi JM",
          desc: "Jl. Mampang Prapat XIV, Jakarta Selatan",
        ),
        SizedBox(height: 30),
        Container(
            margin: EdgeInsets.only(bottom: Themes.marginDefault),
            child: SelectItem()),
        Container(child: SelectItem()),
      ],
    );
  }
}

class SelectItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg_detail2.png',
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 17,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Bakmi Komplit"),
              Container(
                  width: MediaQuery.of(context).size.width -
                      Themes.marginDefault * 2 -
                      17 -
                      55,
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ButtonCircle(
                            icon: Icon(Icons.remove),
                          ),
                          SizedBox(width: 13),
                          Text(
                            "1",
                            style: Themes.fontBold,
                          ),
                          SizedBox(width: 13),
                          ButtonCircle(
                            icon: Icon(
                              Icons.add,
                              color: Themes.red,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text("Rp. 40.000"),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 34,
        child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit),
                hintText: "Kuahnya banyakin, bikin banjir",
                hintStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize: 12),
                filled: true,
                fillColor: Color(0xFFF9F9F9),
                contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                border: OutlineInputBorder(borderSide: BorderSide.none))),
      ),
    ]);
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Detail Pembayaran"),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 16),
          child: generateDashedDivider(
              MediaQuery.of(context).size.width - 2 * Themes.marginDefault),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Rincian"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Biaya Pemesanan"), Text("1000")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Biaya Antar"), Text("1000")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Biaya Layanan"), Text("1000")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Voucher"), Text("1000")],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Total"), Text("1000")],
        ),
      ],
    );
  }
}
