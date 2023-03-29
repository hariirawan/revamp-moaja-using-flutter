part of '_profile.dart';

class InviteFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context)?.size.width;
    double height = MediaQuery.of(context)?.size.height;
    double paddingTop = MediaQuery.of(context).padding.top;

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
            "Ajak Teman pakai MOaja",
            style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
            child: Column(
              children: <Widget>[
                SizedBox(height: height * 0.5),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      width: width * 0.7,
                      margin: EdgeInsets.only(bottom: 14),
                      child: Text(
                        "Yuk ajak teman kamu pakai MOaja!",
                        style: Themes.fontMontserrat12.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2B2A35)),
                      )),
                  Text(
                    "Ajak teman kamu ngerasain asik dan nyamannya pakai MOaja.",
                    style: Themes.fontOpenSans12,
                  ),
                ]),
                SizedBox(height: 99),
                Button(
                  label: Center(
                      child: Text("Ajak Teman",
                          style: Themes.fontMontserrat16Bold.copyWith(
                            color: Colors.white,
                          ))),
                  paddingV: 20.0,
                  width: width - 60,
                )
              ],
            )));
  }
}
