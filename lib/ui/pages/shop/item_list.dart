part of '_shop.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  ScrollController controllerNew;
  bool upArrowFloating = false;
  static double _titlePadding = 150.0;
  double _imageHeight = 320.0;
  double _titlePosition;
  double _initialTitlePosition;
  double _prevExtent = 0.7;

  @override
  void initState() {
    super.initState();
    this._titlePosition = this._imageHeight - _titlePadding;
    this._initialTitlePosition = this._imageHeight - _titlePadding;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    print(upArrowFloating);

    return Scaffold(
        body: SizedBox.expand(
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: _imageHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                height: _imageHeight,
                width: MediaQuery.of(context).size.width,
                image: AssetImage("assets/images/bg_detail2.png"),
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Positioned(
                  top: 8 + MediaQuery.of(context).padding.top,
                  left: Themes.marginDefault,
                  right: Themes.marginDefault,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.3)),
                                child: Icon(MdiIcons.chevronLeft,
                                    color: Colors.white, size: 18))),
                        Container(
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.3)),
                          child: Icon(MdiIcons.shareVariant,
                              color: Colors.white, size: 18),
                        ),
                      ])),
              Positioned(
                top: _titlePosition,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bakmi JM",
                        style: Themes.fontBold.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      RatingStars(
                        voteAverage: 10,
                        starSize: 18.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: Colors.red[300],
                            size: 18,
                          ),
                          SizedBox(
                            width: 12.62,
                          ),
                          Text(
                            "Jl. Mampang Prapatan XIV Jakarta Selatan",
                            style: Themes.fontBold.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.clockTimeTwelveOutline,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: 12.62,
                          ),
                          Text(
                            "Buka",
                            style: Themes.fontBold.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 10),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "08:00 - 20:00 WIB",
                            style: Themes.fontBold.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (notif) {
            double _newRatio =
                _screenHeight - (notif.extent * _screenHeight) + 51;
            if (notif.extent < 0.70) {
              setState(() {
                _imageHeight = _newRatio;
                _titlePosition = _imageHeight - _titlePadding;
              });
            } else {
              setState(() {
                if (notif.extent - _prevExtent > 0) {
                  _titlePosition = _titlePosition - notif.extent;
                } else {
                  if (_titlePosition < _initialTitlePosition) {
                    _titlePosition = _titlePosition + (notif.extent * 2);
                  }
                }
              });
            }
            _prevExtent = notif.extent;
            return true;
          },
          child: DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.06,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                controllerNew = scrollController;
                scrollController.addListener(() {
                  if (upArrowFloating == false) {
                    if (scrollController.offset > 30) {
                      setState(() {
                        upArrowFloating = true;
                      });
                    }
                  } else {
                    if (scrollController.offset < 30) {
                      setState(() {
                        upArrowFloating = false;
                      });
                    }
                  }
                });
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                              height: 4.04,
                              width: 60.58,
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFD8D8D8),
                                  borderRadius: BorderRadius.circular(40))),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Stack(children: [
                                ListView(
                                    padding: EdgeInsets.only(top: 0),
                                    controller: scrollController,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: Themes.marginDefault,
                                              right: Themes.marginDefault,
                                              bottom: 19),
                                          child: Text(
                                            "Menu Favorit",
                                            style: Themes.fontBold,
                                          )),
                                      HomeNews(),
                                      Consumer<ItemListProvider>(
                                        builder:
                                            (context, itemListProvider, _) {
                                          return Center(
                                              child: Stack(children: [
                                            Column(children: [
                                              Column(
                                                  children: List.generate(
                                                      itemListProvider
                                                          .dataItemList.length,
                                                      (index) => Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 30),
                                                          child: cardItem(
                                                              context,
                                                              itemListProvider
                                                                      .dataItemList[
                                                                  index],
                                                              index))).toList()),
                                              SizedBox(height: 64 + 120.0)
                                            ]),
                                          ]));
                                        },
                                      ),
                                    ]),
                                AnimatedPositioned(
                                    bottom:
                                        upArrowFloating == true ? 130 : -150,
                                    left: MediaQuery.of(context).size.width *
                                        0.04,
                                    duration: Duration(milliseconds: 450),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/detail-order');
                                      },
                                      child: Container(
                                        height: 64,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                Themes.marginDefault * 2,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color(0xFFC41622)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/svg/keranjang-on.svg',
                                                semanticsLabel: 'Acme Logo'),
                                            SizedBox(
                                                width: Themes.marginDefault),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "3 Item",
                                                  style: Themes.fontNormal
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                ),
                                                Text(
                                                  "Bakmi JM Gajah Mada...",
                                                  style: Themes.fontNormal
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Text(
                                              "Rp. 18.000",
                                              style: Themes.fontBold.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                              ]))
                        ],
                      ),
                    ));
              }),
        )
      ]),
    ));
  }

  Widget cardItem(BuildContext context, ModelListItem data, int index) {
    double widthItemRight =
        MediaQuery.of(context).size.width - 17 - 80 - Themes.marginDefault * 2;

    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width - Themes.marginDefault * 2,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(image: AssetImage(data.image))),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: widthItemRight,
              child: Row(
                children: [
                  Text(
                    data.name,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    size: 13,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.75,
              child: Text(
                data.desc,
                maxLines: 3,
                style: TextStyle(fontSize: 10),
              ),
            ),
            Container(
              width: widthItemRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.discount.toString(),
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFFC7C7C7),
                              decoration: TextDecoration.lineThrough),
                        ),
                        Text(
                          data.price.toString(),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ]),
                  Spacer(),
                  BtnCounting(index, data.quantity)
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}

class BtnCounting extends StatelessWidget {
  final int index;
  final int quantity;

  BtnCounting(this.index, this.quantity);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ItemListProvider>(context);

    return Container(
        child: quantity == 0
            ? GestureDetector(
                onTap: () {
                  provider.incrementQuanty(index);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6.5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Themes.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Pesan",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ))
            : Row(children: [
                GestureDetector(
                    onTap: () {
                      provider.descrementQuanty(index);
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF4C4C4C).withOpacity(0.1),
                              blurRadius: 15,
                              offset: Offset(4, 4)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: Color(0xFFC5CFD6),
                        size: 16,
                      )),
                    )),
                SizedBox(width: 13),
                Text(
                  quantity.toString(),
                  style: Themes.fontBold,
                ),
                SizedBox(width: 13),
                GestureDetector(
                    onTap: () {
                      provider.incrementQuanty(index);
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF4C4C4C).withOpacity(0.1),
                              blurRadius: 15,
                              offset: Offset(4, 4)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Themes.red,
                        size: 16,
                      )),
                    )),
              ]));
  }
}
