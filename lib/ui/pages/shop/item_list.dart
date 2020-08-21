part of '_shop.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 293,
          child: Stack(
            children: [
              Container(
                height: 250,
                width: width,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/image/bg_item_list.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
              ),
              Positioned(
                  child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Themes.marginDefault, top: Themes.marginDefault),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 92,
                    width: width - Themes.marginDefault * 2,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 7),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF4C4C4C).withOpacity(0.1),
                              blurRadius: 15,
                              offset: Offset(4, 4))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bakmi JM",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingStars(
                          voteAverage: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Themes.red,
                            ),
                            SizedBox(
                              width: 12.62,
                            ),
                            Text(
                              "Jl. Mampang Prapatan XIV, Jakarta Selatan",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer, size: 16),
                            SizedBox(
                              width: 12.62,
                            ),
                            Text(
                              "Buka",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("08:00-21:00", style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 16, left: Themes.marginDefault, right: Themes.marginDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Paket Akhir Bulan",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 30, left: Themes.marginDefault, right: Themes.marginDefault),
          child: Consumer<ItemListProvider>(
              builder: (context, itemListProvider, _) => Column(
                  children: List.generate(
                      itemListProvider.dataItemList.length,
                      (index) => Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: cardItem(
                              context,
                              itemListProvider.dataItemList[index],
                              index))).toList())),
        )
      ],
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
