part of '../_widget.dart';

class ContainerShadow extends StatelessWidget {
  final Widget child;
  ContainerShadow({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        width: MediaQuery.of(context)?.size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            border: Border.all(color: Color(0xFFF2F2F2)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  spreadRadius: .5,
                  blurRadius: 5,
                  offset: Offset(0, 0))
            ]),
        child: child);
  }
}
