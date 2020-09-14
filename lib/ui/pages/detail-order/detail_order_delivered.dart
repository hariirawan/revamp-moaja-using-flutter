part of '_detail_order.dart';

class DetailOrderDelivered extends StatefulWidget {
  @override
  _DetailOrderDeliveredState createState() => _DetailOrderDeliveredState();
}

class _DetailOrderDeliveredState extends State<DetailOrderDelivered> {
  String _character;

  @override
  void initState() {
    super.initState();
    _character = null;
  }

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
              DetailItem(),
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
              onTap: () {
                _modalWaiting(context);
              },
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

  void _modalWaiting(BuildContext context) {
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
                height: MediaQuery.of(context).size.height / 2 + 50,
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
                        SizedBox(height: 51),
                        Container(
                          width: 188,
                          height: 121,
                          margin: EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Themes.greyE5),
                        ),
                        Text(
                          "Sebentar Ya",
                          style: Themes.fontMontserrat16Bold,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Tunggu sebentar ya, kami konfirmasi ke Merchant dulu",
                          style: Themes.fontMontserrat12,
                        ),
                        SizedBox(height: 12),
                        CountingDown(
                          navigate: () {
                            Navigator.of(context).pop();
                            _modalAfterWaiting(context);
                          },
                        ),
                        SizedBox(
                          height: 53,
                        ),
                        Button(
                          outline: true,
                          btnColor: Themes.red,
                          onTap: () {
                            Navigator.pop(context);
                            _modalCancel(context);
                          },
                          label: Text("Batal",
                              style: Themes.fontMontserrat14600
                                  .copyWith(color: Themes.red)),
                          borderRadius: 10,
                        )
                      ]),
                    )),
              );
            },
          );
        });
  }

  void _modalAfterWaiting(BuildContext context) {
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
                        SizedBox(height: 51),
                        Container(
                          width: 188,
                          height: 121,
                          margin: EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Themes.greyE5),
                        ),
                        Text(
                          "Sebentar Ya",
                          style: Themes.fontMontserrat16Bold,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Tunggu sebentar ya, kami konfirmasi ke Merchant dulu",
                          style: Themes.fontMontserrat12,
                        ),
                        SizedBox(
                          height: 53,
                        ),
                        Button(
                          onTap: () {
                            Navigator.pushNamed(context, '/courier-track');
                          },
                          btnColor: Themes.green,
                          label: Text("Lacak Pesananmu",
                              style: Themes.fontMontserrat14600
                                  .copyWith(color: Colors.white)),
                          borderRadius: 10,
                        )
                      ]),
                    )),
              );
            },
          );
        });
  }

  void _modalCancel(BuildContext context) {
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
                        SizedBox(height: 51),
                        Container(
                          width: 188,
                          height: 121,
                          margin: EdgeInsets.only(bottom: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Themes.greyE5),
                        ),
                        Text(
                          "Yakin mau batalin pesanan?",
                          style: Themes.fontMontserrat16Bold,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Kamu yakin mau batalin pesanan ini",
                          style: Themes.fontMontserrat10,
                        ),
                        SizedBox(
                          height: 53,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Button(
                                onTap: () {
                                  // Navigator.pushNamed(context, '/courier-track');
                                },
                                paddingH: 40,
                                btnColor: Themes.green,
                                label: Text("Tidak",
                                    style: Themes.fontMontserrat14600
                                        .copyWith(color: Colors.white)),
                                borderRadius: 10,
                              ),
                              SizedBox(width: 20),
                              Button(
                                onTap: () {
                                  // Navigator.pushNamed(context, '/courier-track');
                                  Navigator.pop(context);
                                  _modalCancelYes(context, _character);
                                },
                                paddingH: 40,
                                btnColor: Themes.red,
                                label: Text("Ya",
                                    style: Themes.fontMontserrat14600
                                        .copyWith(color: Colors.white)),
                                borderRadius: 10,
                              )
                            ])
                      ]),
                    )),
              );
            },
          );
        });
  }

  void _modalCancelYes(BuildContext context, String _character) {
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
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: ListReason()),
              );
            },
          );
        });
  }
}

class ListReason extends StatefulWidget {
  @override
  _ListReasonState createState() => _ListReasonState();
}

class _ListReasonState extends State<ListReason> {
  final List<String> _reason = [
    "Barang atau layanan tidak tersedia!",
    "Lokasi Merchant terlalu jauh",
    "Berubah pikiran",
    "Melewati batas maksimal pemesanan",
    "Lainnya",
  ];

  String _character;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: NeverScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22),
        child: Column(children: [
          Container(
              height: 4.04,
              width: 60.58,
              margin: EdgeInsets.only(top: 10, bottom: 15.96),
              decoration: BoxDecoration(
                  color: Color(0xFFD8D8D8),
                  borderRadius: BorderRadius.circular(40))),
          Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(children: [
                SizedBox(height: 51),
                Column(children: [
                  Container(
                    width: 188,
                    height: 121,
                    margin: EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Themes.greyE5),
                  ),
                  Text(
                    "Pesanan dibatalkan",
                    style: Themes.fontMontserrat16Bold,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Beri alasan kenapa kamu ingin membatalkan pesanan ini:",
                    style: Themes.fontMontserrat10,
                  ),
                ]),
                SizedBox(
                  height: 27,
                ),
                Column(
                  children: List.generate(_reason.length, (index) {
                    return Row(children: [
                      Radio(
                        value: _reason[index],
                        groupValue: _character,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onChanged: (String value) {
                          print(value);
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _character = _reason[index];
                                });
                              },
                              child: Text(_reason[index]),
                            ),
                          ])
                    ]);
                  }).toList(),
                ),
                _character == "Lainnya"
                    ? Container(
                        padding: EdgeInsets.only(left: 40),
                        child: TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                                hintText: "Tulis disini",
                                hintStyle: TextStyle(
                                    color: Color(0xFFBDBDBD), fontSize: 12),
                                filled: true,
                                fillColor: Color(0xFFF9F9F9),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFBDBDBD))))))
                    : SizedBox(),
                SizedBox(
                  height: 40,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        onTap: () {
                          // Navigator.pushNamed(context, '/courier-track');
                        },
                        paddingH: 40,
                        btnColor: Themes.green,
                        label: Text("Tidak",
                            style: Themes.fontMontserrat14600
                                .copyWith(color: Colors.white)),
                        borderRadius: 10,
                      ),
                      SizedBox(width: 20),
                      Button(
                        onTap: () {
                          // Navigator.pushNamed(context, '/courier-track');
                        },
                        paddingH: 40,
                        btnColor: Themes.red,
                        label: Text("Ya, Lanjutkan",
                            style: Themes.fontMontserrat14600
                                .copyWith(color: Colors.white)),
                        borderRadius: 10,
                      )
                    ])
              ]))
        ]),
      ),
    );
  }
}
