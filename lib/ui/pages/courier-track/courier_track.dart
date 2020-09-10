part of '_courier_track.dart';

class CourierTrack extends StatefulWidget {
  @override
  _CourierTrackState createState() => _CourierTrackState();
}

class _CourierTrackState extends State<CourierTrack> {
  int _currentStep = 1;
  bool _isCollapse = true;

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
    double initialSize = _isCollapse ? 0.8 : 0.5;
    double initalWidthSize = 0.5;

    return Scaffold(
        body: SizedBox.expand(
      child: Stack(children: [
        Stack(
          fit: StackFit.expand,
          children: [
            Image(
              width: MediaQuery.of(context).size.width,
              image: AssetImage("assets/images/bg_detail2.png"),
              fit: BoxFit.cover,
            ),
          ],
        ),
        DraggableScrollableSheet(
            initialChildSize: initialSize,
            minChildSize: initialSize - 0.15,
            maxChildSize: initialSize,
            builder: (context, scrollController) {
              return Container(
                height: MediaQuery.of(context).size.height * initialSize,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                            // height: 109.04,
                            height: 200,
                            color: Themes.green,
                            padding: EdgeInsets.only(
                                left: Themes.marginDefault,
                                right: Themes.marginDefault,
                                top: 200 - 109.04),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60.0,
                                    width: MediaQuery.of(context).size.width *
                                            initalWidthSize -
                                        10,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/courier/foto-courier.png'),
                                                    fit: BoxFit.cover))),
                                        SizedBox(width: 7.7),
                                        Container(
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    initalWidthSize -
                                                10 -
                                                60.0 -
                                                7.7,
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Kurir Kamu",
                                                                style: Themes
                                                                    .fontMontserrat10
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                              Text(
                                                                "Hilman",
                                                                style: Themes
                                                                    .fontMontserrat14
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .white),
                                                              ),
                                                            ]),
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                          size: 20,
                                                        )
                                                      ]),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(8.65),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white
                                                            .withOpacity(0.2)),
                                                    child: Icon(
                                                      MdiIcons.phone,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ]))
                                      ],
                                    ),
                                  ),
                                  Container(
                                      height: 60,
                                      child: generateDashedDividerV(60)),
                                  Container(
                                    height: 60.0,
                                    width: MediaQuery.of(context).size.width *
                                            initalWidthSize -
                                        10 -
                                        Themes.marginDefault * 2 -
                                        7.7,
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.65),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white
                                                    .withOpacity(0.2)),
                                            child: Icon(
                                              Icons.chat_bubble,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Bakmi JM",
                                                        style: Themes
                                                            .fontMontserrat14
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                      Text(
                                                        "Bakmi JM",
                                                        style: Themes
                                                            .fontMontserrat14
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ]),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              ]),
                                        ]),
                                  ),
                                ]))),
                    Container(
                        height:
                            MediaQuery.of(context).size.height * initialSize,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          // physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Themes.marginDefault + 10.37),
                                  height: MediaQuery.of(context).size.height *
                                          initialSize -
                                      109.04,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Column(children: [
                                    Container(
                                      height: 4.04,
                                      width: 60.58,
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFD8D8D8),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 33.87, bottom: 25),
                                      child: StepIndicator(this._currentStep),
                                    ),
                                    generateDashedDividerH(
                                        MediaQuery.of(context).size.width -
                                            (Themes.marginDefault * 2 +
                                                10.37 * 2)),
                                    SizedBox(height: 20),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey[300]),
                                              ),
                                              SizedBox(width: 19.71),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Delivery Time",
                                                      style: Themes
                                                          .fontOpenSans12
                                                          .copyWith(
                                                              color: Color(
                                                                  0xFFB0B2B8)),
                                                    ),
                                                    Text(
                                                      "12:45 PM",
                                                      style: Themes
                                                          .fontOpenSans12Bold,
                                                    ),
                                                  ])
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _isCollapse = !_isCollapse;
                                              });
                                            },
                                            child: Text(
                                              "Detail Pesanan",
                                              style: Themes.fontMontserrat12
                                                  .copyWith(color: Themes.red),
                                            ),
                                          )
                                        ])
                                  ])),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            }),
      ]),
    ));
  }
}

class StepIndicator extends StatelessWidget {
  final currentStep;

  StepIndicator(this.currentStep);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Indicator(
              title: "Pesanan di konfirmasi",
              isActive: currentStep >= 0,
            ),
            Indicator(
              title: "Pesanan sudah siap",
              isActive: currentStep >= 1,
            ),
            Indicator(title: "Pesanan menuju kamu", isActive: currentStep >= 2),
            Indicator(
              title: "Pesanan sampai",
              isActive: currentStep >= 3,
              isLast: true,
            ),
          ],
        ));
  }
}

class Indicator extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;

  Indicator({@required this.title, this.isActive = false, this.isLast = false});
  @override
  Widget build(BuildContext context) {
    double height = 15.0;
    int n = height ~/ 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 13.46,
              width: 13.46,
              decoration: BoxDecoration(
                  color: isActive ? Themes.green : Themes.greyE5,
                  shape: BoxShape.circle),
            ),
            SizedBox(width: 19.17),
            Text(title,
                style: Themes.fontOpenSans14600.copyWith(
                  color: isActive ? Themes.green : Themes.greyE5,
                ))
          ],
        ),
        isLast
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(left: 13.46 / 2 - 1),
                child: Column(
                  children: List.generate(
                      n,
                      (index) => (index % 2 == 0)
                          ? Container(
                              height: 5,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: Themes.greyE5,
                                  borderRadius: BorderRadius.circular(5)),
                            )
                          : SizedBox(
                              height: height / n,
                            )),
                ))
      ],
    );
  }
}
