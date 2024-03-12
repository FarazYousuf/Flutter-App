import 'dart:convert';

Products productsfromjson(String str) => Products.fromJson(jsonDecode(str));

class Products {

 Products({this.id, this.barcode, this.brand, this.name, this.price, this.scandate});

  int? id;
  int? barcode;
  String? name;
  String? brand;
  int? price;
  String? scandate;

 factory Products.fromJson(Map<String, dynamic> json) => Products(
  id: json['id'],
  barcode: json['barcode'],
  name: json['name'],
  brand: json['brand'],
  price: json['price'],
  scandate: json['scandate'],
);

}