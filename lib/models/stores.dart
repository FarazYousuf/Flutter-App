import 'dart:convert';

Stores productsfromjson(String str) => Stores.fromJson(jsonDecode(str));

class Stores {

 Stores({this.id, this.name, this.city, this.address});

  int? id;
  String? name;
  String? city;
  String? address;

 factory Stores.fromJson(Map<String, dynamic> json) => Stores(
  id: json['id'],
  name: json['name'],
  city: json['city'],
  address: json['address'],
);
}