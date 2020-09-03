part of '_widget.dart';

class BannerHead extends StatelessWidget {
  final String banner;
  final Widget children;

  BannerHead({@required this.banner, this.children});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      width: width,
      child: Stack(
        children: [
          ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: 285,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(banner), fit: BoxFit.cover)),
              )),
          children == null ? SizedBox() : children
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
