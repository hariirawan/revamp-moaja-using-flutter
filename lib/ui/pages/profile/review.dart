part of '_profile.dart';

class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Ulasanku",
            style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: ValueKey(index),
                    background: Container(
                      color: Color(0xFFC41622),
                      padding: EdgeInsets.only(right: Themes.marginDefault),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete, color: Colors.white),
                              Text(
                                "Hapus",
                                style: Themes.fontMontserrat14
                                    .copyWith(color: Colors.white),
                              )
                            ]),
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    child: Container(
                        margin: EdgeInsets.only(top: index == 0 ? 20 : 0),
                        child: CardMyReview()),
                  );
                },
              ),
            )
          ],
        ));
  }
}

class CardMyReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: AssetImage('assets/images/image-review.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: 20),
            Container(
                width: MediaQuery.of(context).size.width -
                    (Themes.marginDefault * 2 + 100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bakmi Komplit",
                        style: Themes.fontMontserrat14600,
                      ),
                      Text(
                        "Enak banget, gatau lagi, mo beli lagi tapi takut beli mulu. tapi kalo dibayarin kamu",
                        maxLines: 3,
                        style: Themes.fontOpenSans12,
                      ),
                      SizedBox(height: 10),
                      Container(
                          height: 18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("66 Likes", style: Themes.fontOpenSans8),
                                  VerticalDivider(
                                      indent: 1,
                                      endIndent: 7,
                                      color: Color(0xFF4C4C4C)),
                                  Text("60 Komentar",
                                      style: Themes.fontOpenSans8),
                                ],
                              ),
                              Text(
                                "18 Agustus",
                                style: Themes.fontOpenSans8,
                              ),
                            ],
                          ))
                    ]))
          ],
        ));
  }
}
