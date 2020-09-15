part of '_home.dart';

class HomeNews extends StatefulWidget {
  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  final controller = PageController(initialPage: 1, viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 269.0 - 22.0,
        child: PageView.builder(
            pageSnapping: true,
            controller: controller,
            itemCount: 4,
            itemBuilder: (context, index) => CardNews()));
  }
}
