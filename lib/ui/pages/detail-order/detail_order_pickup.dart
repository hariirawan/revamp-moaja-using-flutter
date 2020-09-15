part of '_detail_order.dart';

class DetailOrderPickUp extends StatelessWidget {
  const DetailOrderPickUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Themes.marginDefault, right: Themes.marginDefault),
            width: MediaQuery.of(context).size.width - Themes.marginDefault * 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [DetailItem(), SizedBox(height: 120)]),
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
