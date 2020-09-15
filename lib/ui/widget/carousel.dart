part of '_widget.dart';

class Carousel extends StatefulWidget {
  final Widget children;

  Carousel({this.children});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
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
            itemBuilder: (context, index) => widget.children));
  }
}
