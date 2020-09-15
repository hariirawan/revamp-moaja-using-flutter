part of '_profile.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _name;
  TextEditingController _phoneNumber;
  TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: "Hari irawan");
    _phoneNumber = TextEditingController(text: "087866833174");
    _email = TextEditingController(text: "hari3112193@gmail.com");
  }

  @override
  void dispose() {
    _name.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    super.dispose();
  }

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
            "Edit Profile",
            style: TextStyle(color: Color(0xFF4D4D4D), fontSize: 16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(children: [
          SizedBox(height: 20),
          Center(
              child: Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/courier/foto-courier.png'),
                    fit: BoxFit.cover)),
          )),
          SizedBox(
            height: 37,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: Themes.marginDefault),
              child: Column(
                children: [
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(hintText: "Masukkan Nama.."),
                  ),
                  TextField(
                    controller: _phoneNumber,
                    decoration:
                        InputDecoration(hintText: "Masukkan Nomor Telpon..."),
                  ),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(hintText: "Masukkan email..."),
                  ),
                  SizedBox(height: 50),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Button(
                        paddingV: 5,
                        paddingH: 16,
                        label: Text("Simpan",
                            style: Themes.fontMontserrat12
                                .copyWith(color: Colors.white)))
                  ])
                ],
              ))
        ]));
  }
}
