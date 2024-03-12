import 'dart:convert';

Stores productsfromjson(String str) => Stores.fromJson(jsonDecode(str));

class Stores {

 Stores({this.id, this.name, this.countrycode, this.currencycode});

  int? id;
  String? countrycode;
  String? name;
  String? currencycode;

 factory Stores.fromJson(Map<String, dynamic> json) => Stores(
  id: json['id'],
  countrycode: json['countrycode'],
  name: json['name'],
  currencycode: json['currencycode'],
);
}