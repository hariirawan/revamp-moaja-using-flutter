part of '_detail_order.dart';

class PaymentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Detail Pembayaran",
          style: Themes.fontMontserrat
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 16),
          child: generateDashedDividerH(
              MediaQuery.of(context)?.size.width - 2 * Themes.marginDefault),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Rincian",
            style: Themes.fontMontserrat
                .copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
        Details()
      ],
    );
  }
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListItemProvider>(builder: (context, item, _) {
      if (item.itemCheckout.length < 1) {
        return SizedBox();
      }
      int result = item.itemCheckout
          .map((e) => e.total)
          .reduce((value, element) => value + element);
      int discount = item.itemCheckout
          .map((e) => e.discount)
          .reduce((value, element) => value + element);

      int sumDiscount = result + discount;

      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Biaya Pemesanan", style: Themes.fontOpenSans12),
            Row(children: [
              Text(
                "$sumDiscount",
                style: Themes.fontOpenSans12.copyWith(
                    color: Themes.red, decoration: TextDecoration.lineThrough),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$result",
                style: Themes.fontOpenSans12,
              )
            ]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Biaya Antar", style: Themes.fontOpenSans12),
            Text("0", style: Themes.fontOpenSans12)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Biaya Layanan", style: Themes.fontOpenSans12),
            Text("0", style: Themes.fontOpenSans12)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Voucher", style: Themes.fontOpenSans12),
            Text("0", style: Themes.fontOpenSans12)
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total", style: Themes.fontOpenSans12Bold),
            Text("${result + 1000}", style: Themes.fontOpenSans12Bold)
          ],
        ),
      ]);
    });
  }
}
