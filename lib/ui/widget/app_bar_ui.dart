part of '_widget.dart';

class AppBarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Halo, Nunu',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                  ),
                ),
                Text(
                  'Alamat pengiriman, Jl. Kuningan Barat',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Color(0xFFFFEFEF),
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.notifications,
              color: Color(0xFFF14343),
            ),
          )
        ],
      ),
    );
  }
}
