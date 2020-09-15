part of '_shared.dart';

Widget generateDashedDividerH(double width) {
  int n = width ~/ 5;
  return Row(
    children: List.generate(
        n,
        (index) => (index % 2 == 0)
            ? Container(
                height: 1,
                width: width / n,
                color: Color(0xFFE4E4E4),
              )
            : SizedBox(
                width: width / n,
              )),
  );
}

Widget generateDashedDividerV(double height, {Color color}) {
  int n = height ~/ 5;
  return Column(
    children: List.generate(
        n,
        (index) => (index % 2 == 0)
            ? Container(
                height: height / n,
                width: 2,
                color: color != null ? color : Color(0xFFE4E4E4),
              )
            : SizedBox(
                height: height / n,
              )),
  );
}
