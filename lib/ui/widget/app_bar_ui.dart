part of '_widget.dart';

class AppBarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(20.0),
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
          Stack(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Color(0xFFFFEFEF),
                    borderRadius: BorderRadius.circular(35)),
                child: Icon(
                  Icons.notifications,
                  color: Color(0xFFF14343),
                  size: 18,
                ),
              ),
              Positioned(
                  top: 0.1,
                  right: 3.0,
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red),
                    child: Center(
                      child: Text("9+",
                          style: TextStyle(fontSize: 8, color: Colors.white)),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
