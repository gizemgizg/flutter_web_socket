class Bids {
  double? price;
  double? piece;

  Bids({this.price, this.piece});

  Bids.fromJson(List json) {
    price = json[0];
    piece = double.parse(json[1].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['price'] = price;
    data['piece'] = piece;
    return data;
  }
}