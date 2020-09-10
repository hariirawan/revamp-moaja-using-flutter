part of '_detail_order.dart';

class DetailOrderDelivered extends StatelessWidget {
  const DetailOrderDelivered({Key key}) : super(key: key);

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
}

class CountingDown extends StatefulWidget {
  final Function navigate;

  CountingDown({this.navigate});

  @override
  _CountingDownState createState() => _CountingDownState();
}

class _CountingDownState extends State<CountingDown> {
  Timer _timer;
  int _start = 10;

  @override
  void initState() {
    super.initState();
    this.startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start == 1) {
            if (widget.navigate != null) {
              widget.navigate();
            }
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$_start Detik",
        style: Themes.fontMontserrat16Bold,
      ),
    );
  }
}
