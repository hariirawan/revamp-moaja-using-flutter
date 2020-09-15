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
        body:
            TabBarView(children: [DetailOrderDelivered(), DetailOrderPickUp()]),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final List<String> _eWallet = ["Dana", "LinkAja"];
  final List<String> _va = [
    "BCA",
    "Mandiri",
    "BNI",
    "BRI",
    "PERMATA",
    "CIMB NIAGA",
    "BNI Syariah",
    "GENIUS",
    "CIMB NIAGA",
    "BNI Syariah",
    "GENIUS"
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
      builder: (context, payment, _) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: ListItem(),
          ),
          PaymentDetails(),
          SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width - Themes.marginDefault * 2,
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
          SizedBox(height: 20),
          Center(
            child: payment.paymentType == "TUNAI"
                ? _paymentType(context)
                : _paymentVA(context, payment.paymentName),
          ),
        ]);
      },
    );
  }

  Widget _paymentVA(BuildContext context, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerShadow(
          child: Text(
            "ID Pesanan : 123456",
            style: Themes.fontOpenSans14600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ContainerShadow(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Batas Waktu Pembayaran",
                style: Themes.fontOpenSans11,
              ),
              Badge(
                label: Text(
                  "Menunggu",
                  style: Themes.fontOpenSans
                      .copyWith(fontSize: 9, color: Colors.white),
                ),
                color: Color(0xFFF97A1F),
              )
            ],
          ),
          SizedBox(height: 9),
          Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Themes.greyE5))),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Senin, 07 Juli 2020 11:47 WIB",
                        style: Themes.fontOpenSans12
                            .copyWith(color: Color(0xFFBDBDBD)),
                      ),
                      Container(
                        child: Text("02:00:00",
                            style: Themes.fontOpenSans12
                                .copyWith(color: Color(0xFFBDBDBD))),
                      ),
                    ],
                  ))),
          Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Themes.greyE5))),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 11, top: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$name Virtual Account",
                        style: Themes.fontOpenSans14Bold,
                      ),
                    ],
                  ))),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    "No. Virtual Account",
                    style: Themes.fontOpenSans11,
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "80777085295973444",
                  style: Themes.fontOpenSans14600,
                ),
                Text("Salin",
                    style:
                        Themes.fontOpenSans14600.copyWith(color: Themes.green)),
              ])
            ],
          )),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 8),
                  child:
                      Text("Total Pembayaran", style: Themes.fontOpenSans11)),
              Padding(
                  padding: EdgeInsets.only(bottom: 21),
                  child: Text(
                    "Rp. 85.000",
                    style: Themes.fontMontserrat14600,
                  )),
            ],
          )),
        ])),
        SizedBox(height: 30),
        InkWell(
            onTap: () {
              _onPaymentGuide(context);
            },
            child: ContainerShadow(
              child: Center(
                child: Text("Petunjuk Pembayaran",
                    style: Themes.fontMontserrat12600
                        .copyWith(color: Themes.green)),
              ),
            )),
        SizedBox(height: 15),
        GestureDetector(
            onTap: () {
              _onPaymentMethod(context);
            },
            child: ContainerShadow(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Metode Pembayaran",
                  style: Themes.fontMontserrat12,
                ),
                Text(
                  "Ganti",
                  style: Themes.fontMontserrat.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Themes.green),
                ),
              ],
            )))
      ],
    );
  }

  Widget _paymentType(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onPaymentMethod(context);
        },
        child: ContainerShadow(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Metode Pembayaran (Tunai)",
              style: Themes.fontMontserrat12,
            ),
            Text(
              "Ganti",
              style: Themes.fontMontserrat.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Themes.green),
            ),
          ],
        )));
  }

  void _onPaymentMethod(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return Consumer<PaymentProvider>(
            builder: (context, payment, _) {
              return Container(
                height: MediaQuery.of(context).size.height - 100,
                child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      child: Column(children: [
                        Container(
                            height: 4.04,
                            width: 60.58,
                            margin: EdgeInsets.only(top: 10, bottom: 15.96),
                            decoration: BoxDecoration(
                                color: Color(0xFFD8D8D8),
                                borderRadius: BorderRadius.circular(40))),
                        Text(
                          "Pilih Metode Pembayaran",
                          style: Themes.fontMontserrat
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Themes.marginDefault),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Material(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        payment.setPaymentChange(
                                            "TUNAI", "TUNAI");
                                      },
                                      child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0),
                                          title: Text("Tunai"),
                                          trailing:
                                              Icon(Icons.keyboard_arrow_right)),
                                    ),
                                  ),
                                  Divider(),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 23),
                                    child: Text("E-Wallet",
                                        style: Themes.fontMontserrat.copyWith(
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Column(
                                    children: List.generate(
                                            _eWallet.length,
                                            (index) => ListTile(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0),
                                                title: Text(_eWallet[index]),
                                                trailing: Icon(Icons
                                                    .keyboard_arrow_right)))
                                        .toList(),
                                  ),
                                  Divider(),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 23, top: 19),
                                    child: Text("Transfer VA",
                                        style: Themes.fontMontserrat.copyWith(
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Column(
                                    children: List.generate(
                                            _va.length,
                                            (index) => Material(
                                                child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      payment.setPaymentChange(
                                                        "VA",
                                                        _va[index],
                                                      );
                                                    },
                                                    child: ListTile(
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 0),
                                                        title: Text(_va[index]),
                                                        trailing: Icon(Icons
                                                            .keyboard_arrow_right)))))
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: 90,
                                  )
                                ],
                              ),
                            )
                          ]),
                        )
                      ]),
                    )),
              );
            },
          );
        });
  }

  void _onPaymentGuide(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context) {
          return Consumer<PaymentProvider>(
            builder: (context, payment, _) {
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      child: Column(children: [
                        Container(
                            height: 4.04,
                            width: 60.58,
                            margin: EdgeInsets.only(top: 10, bottom: 15.96),
                            decoration: BoxDecoration(
                                color: Color(0xFFD8D8D8),
                                borderRadius: BorderRadius.circular(40))),
                        Text(
                          "Panduan Pembayaran",
                          style: Themes.fontMontserrat
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 2,
                            child: ListView(children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Themes.marginDefault,
                                    vertical: 9),
                                child: Text("Bank BCA",
                                    style: Themes.fontMontserrat14600),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Themes.marginDefault),
                                child: Column(
                                    children: List.generate(
                                        9,
                                        (index) => Text(
                                              "${index + 1}. Petunjuk Pembayaran Petunjuk Pembayaran Petunjuk",
                                              style: Themes.fontMontserrat12600,
                                            ))),
                              )
                            ]))
                      ]),
                    )),
              );
            },
          );
        });
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ListItemProvider>(
      builder: (context, item, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Daftar Pesanan",
              style: Themes.fontMontserrat14600,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 16),
              child: generateDashedDividerH(
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
            item.itemCheckout.length < 1
                ? Text("Data Belum ada")
                : Column(
                    children: item.itemCheckout
                        .map(
                          (e) => e.quantity == 0
                              ? SizedBox()
                              : Container(
                                  margin: EdgeInsets.only(
                                      bottom: Themes.marginDefault),
                                  child: SelectItem(
                                    item: e,
                                  )),
                        )
                        .toList()),
          ],
        );
      },
    );
  }
}

class SelectItem extends StatelessWidget {
  final ModelListItem item;
  SelectItem({this.item});

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
                      item.image,
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
              Text(item.name,
                  style: Themes.fontMontserrat
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
              Container(
                  width: MediaQuery.of(context).size.width -
                      Themes.marginDefault * 2 -
                      17 -
                      55,
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BtnCounting(item.id, item),
                      Row(
                        children: [
                          Text(
                            "${item.discount + item.price}",
                            style: Themes.fontMontserrat.copyWith(
                                color: Color(0xFFC5CFD6),
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${item.price}",
                            style: Themes.fontMontserrat.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          )
                        ],
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
