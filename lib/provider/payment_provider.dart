part of '_provider.dart';

class PaymentProvider extends ChangeNotifier {
  String _paymentName = "";
  String _paymentType = "TUNAI";

  String get paymentType => _paymentType;
  String get paymentName => _paymentName;

  void setPaymentChange(String type, String name) {
    _paymentType = type;
    _paymentName = name;
    notifyListeners();
  }
}
