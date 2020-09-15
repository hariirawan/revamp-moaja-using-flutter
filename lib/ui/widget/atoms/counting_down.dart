part of '../_widget.dart';

class CountingDown extends StatefulWidget {
  final Function navigate;

  CountingDown({this.navigate});

  @override
  _CountingDownState createState() => _CountingDownState();
}

class _CountingDownState extends State<CountingDown> {
  Timer _timer;
  int _start = 10;

  @override
  void initState() {
    super.initState();
    this.startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start == 1) {
            if (widget.navigate != null) {
              widget.navigate();
            }
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$_start Detik",
        style: Themes.fontMontserrat16Bold,
      ),
    );
  }
}
