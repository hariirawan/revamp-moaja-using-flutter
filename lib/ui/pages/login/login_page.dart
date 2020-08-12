part of '_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController code = TextEditingController();

  bool _isNumberValid = false;

  @override
  void initState() {
    super.initState();
    phoneNumber.text = "";
    code.text = "+62";
  }

  void dispose() {
    phoneNumber.dispose();
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 102),
                Center(child: SizedBox(child: Image.asset('assets/icon.png'))),
                SizedBox(height: 32.39),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 26),
                ),
                Text("Enter your mobile phone number to continue",
                    style: TextStyle(fontSize: 14)),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: 50,
                      child: TextField(controller: code),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 2,
                      child: TextField(
                          onChanged: (text) {
                            if (text != "") {
                              setState(() {
                                _isNumberValid = true;
                              });
                            } else {
                              setState(() {
                                _isNumberValid = false;
                              });
                            }
                          },
                          controller: phoneNumber,
                          decoration: InputDecoration(hintText: "87866833164"),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ]),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(top: 54),
              child: Center(
                child: Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: _isNumberValid ? Colors.white : Color(0xFF50BD58)),
                ),
              ),
              decoration: BoxDecoration(
                color: _isNumberValid ? Color(0xFF50BD58) : Colors.white,
                borderRadius: BorderRadius.circular(76),
                border: Border.all(color: Color(0xFF50BD58)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'We care about your data privacy.Here’s our ',
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 10, color: Color(0xFF50BD58)),
                ),
                Spacer(), // 2nd spacer
              ],
            ),
            SizedBox(height: 35.59),
            Row(children: <Widget>[
              Expanded(child: Divider()),
              Text("or continue with"),
              Expanded(child: Divider()),
            ]),
            SizedBox(height: 30),
            Row(
              children: [
                Spacer(),
                LoginSosmed(
                  icon: Icon(
                    MdiIcons.facebook,
                    color: Colors.blue,
                  ),
                ),
                LoginSosmed(
                  icon: Icon(MdiIcons.gmail, color: Colors.red),
                ),
                LoginSosmed(
                  icon: Icon(MdiIcons.apple),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
