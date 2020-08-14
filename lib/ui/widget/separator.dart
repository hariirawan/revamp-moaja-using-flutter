part of '_widget.dart';

class Separator extends StatelessWidget {
  final String label;
  Separator(this.label);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: Divider()),
      Text("$label"),
      Expanded(child: Divider()),
    ]);
  }
}
