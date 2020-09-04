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
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      FractionallySizedBox(
        child: Image.asset(
          'assets/images/bg_item_list.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.65,
          builder: (context, scrollController) {
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
                          height: MediaQuery.of(context).size.height * 0.80,
                          padding: EdgeInsets.only(
                              bottom: Themes.marginDefault,
                              left: Themes.marginDefault,
                              right: Themes.marginDefault),
                          child: Consumer<ItemListProvider>(
                            builder: (context, itemListProvider, _) {
                              return ListView.builder(
                                  controller: scrollController,
                                  itemCount:
                                      itemListProvider.dataItemList.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Container(
                                          margin: EdgeInsets.only(bottom: 30),
                                          child: cardItem(
                                              context,
                                              itemListProvider
                                                  .dataItemList[index],
                                              index)));
                            },
                          ))
                    ],
                  ),
                ));
          })
    ]));
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
