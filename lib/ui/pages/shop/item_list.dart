part of '_shop.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

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
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context)?.size.height;

    return Scaffold(
        body: SizedBox.expand(
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context)?.size.width,
          height: _imageHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                height: _imageHeight,
                width: MediaQuery.of(context)?.size.width,
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
                        style: Themes.fontMontserrat.copyWith(
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
                            style: Themes.fontMontserrat.copyWith(
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
                            style: Themes.fontMontserrat.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 10),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "08:00 - 20:00 WIB",
                            style: Themes.fontMontserrat.copyWith(
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
                return Consumer<ListItemProvider>(
                    builder: (context, itemProvider, _) {
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
                                width: MediaQuery.of(context)?.size.width,
                                height: MediaQuery.of(context)?.size.height,
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
                                              style: Themes.fontMontserrat,
                                            )),
                                        HomeNews(),
                                        Column(
                                            children: List.generate(
                                                itemProvider
                                                    .dataItemList.length,
                                                (index) => Container(
                                                    child: cardItem(
                                                        context,
                                                        itemProvider
                                                                .dataItemList[
                                                            index],
                                                        index))).toList()),
                                        SizedBox(height: 64 + 120.0),
                                      ]),
                                  AnimatedPositioned(
                                      bottom:
                                          itemProvider.itemCheckout.length > 0
                                              ? 130
                                              : -150,
                                      left: MediaQuery.of(context)?.size.width *
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
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
                                                  semanticsLabel:
                                                      'Keranjang On'),
                                              SizedBox(
                                                  width: Themes.marginDefault),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${itemProvider.itemCheckout.length} Item",
                                                    style: Themes.fontOpenSans
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14),
                                                  ),
                                                  Text(
                                                    "Bakmi JM Gajah Mada...",
                                                    style: Themes.fontOpenSans
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              Text(
                                                "Rp. 18.000",
                                                style: Themes.fontMontserrat
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ]))
                          ],
                        ),
                      ));
                });
              }),
        )
      ]),
    ));
  }

  Widget cardItem(BuildContext context, ModelListItem data, int index) {
    double widthItemRight =
        MediaQuery.of(context)?.size.width - 17 - 80 - Themes.marginDefault * 2;

    var provider = Provider.of<ListItemProvider>(context);

    return Stack(children: [
      Container(
        height: 110,
        // margin: EdgeInsets.only(bottom: 30),
        padding: EdgeInsets.only(
            left: Themes.marginDefault,
            right: Themes.marginDefault,
            top: 15,
            bottom: 15),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        width: MediaQuery.of(context)?.size.width / 1.75,
                        child: Text(
                          data.desc,
                          maxLines: 3,
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ]),
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
                    data.quantity == 0
                        ? GestureDetector(
                            onTap: () {
                              provider.incrementQuanty(data.id);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.5, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Themes.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Pesan",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ))
                        : BtnCounting(index, data)
                  ],
                ),
              )
            ],
          )
        ]),
      ),
      Positioned(
          right: 10,
          top: 15 / 2,
          child: Likes(
            isLike: data.isLike,
            index: index,
          ))
    ]);
  }
}

class Likes extends StatefulWidget {
  final bool isLike;
  final int index;
  Likes({this.isLike, this.index});

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  ScrollController controllerNew;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListItemProvider>(context);

    return GestureDetector(
        onTap: () {
          if (widget.isLike == false) {
            provider.onLikes(widget.index);
            _animationController.reset();
            _animationController.forward();
          } else {
            provider.onLikes(widget.index);
            _animationController.reset();
            _animationController.forward();
          }
        },
        child: SizedBox(
          height: 40,
          width: 40,
          child: widget.isLike
              ? LottieBuilder.asset(
                  'assets/icons/likes-lottifiles.json',
                  controller: _animationController,
                )
              : LottieBuilder.asset(
                  'assets/icons/heart-break-lottifiles.json',
                  controller: _animationController,
                ),
        ));
  }
}

class BtnCounting extends StatelessWidget {
  final int index;
  final ModelListItem data;

  BtnCounting(this.index, this.data);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListItemProvider>(context);

    return Container(
        child: Row(children: [
      GestureDetector(
          onTap: () {
            provider.descrementQuanty(data.id);
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
        data.quantity.toString(),
        style: Themes.fontMontserrat,
      ),
      SizedBox(width: 13),
      GestureDetector(
          onTap: () {
            provider.incrementQuanty(data.id);
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
