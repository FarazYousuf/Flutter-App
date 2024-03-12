import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test2/models/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Testing",
      home: TestingApp(title: "xyz"),
    );
  }
}


class TestingApp extends StatefulWidget {
  const TestingApp({super.key, required this.title});


  final String title;

  @override
  State<TestingApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestingApp> {

 late List<Products> data;
 bool isloading = false;

  @override
  void initState() {
    readLocalJson();
    super.initState();
  }

  Future<List<Products>> readLocalJson() async{
    isloading = true;
    var d = await rootBundle.loadString("assets/products.json");
    print("Loaded data: $d"); // Print the raw loaded string
    final data = jsonDecode(d) as List<dynamic>;
   // var productData = jsonDecode(d);
   //var decodedData = jsonDecode(d);
  //print("Decoded data: $decodedData");

     final products = data.map((item) => Products.fromJson(item)).toList();
    setState(() {
    this.data = products;
  });
  return products;
  }



@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Display JSON"),
    ),
    body: FutureBuilder<List<Products>>(
      future: readLocalJson(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!; // Safe access after checking hasData
          return (data.isNotEmpty)
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final product = data[index];
                    return ListTile(
                      title: Text(product.name!), // Assuming 'name' is a property
                      subtitle: Text(product.brand!), // Assuming 'brand' is a property
                      // Add more ListTile properties for other product details
                    );
                  },
                )
              : const Center(
                  child: Text("No products found"),
                );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        return const Center(child: CircularProgressIndicator());
      },
    ),
  );
}



//   @override
//   Widget build(BuildContext context) {
 
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Display JSON")
//       ),
//         body: isloading ? const Center(child: CircularProgressIndicator())
//         // Display List of Products if data is a List
//         : data.isNotEmpty 
//             ? ListView.builder( // Check for empty list as well
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   final product = data[index] as Products;
//                   return ListTile(
//                     title: Text(product.name!),
//                     subtitle: Text(product.brand!),
//                     // ... add other product details
//                   );
//                 },
//               )
//         : const Center(
//           child: Text("No Products Found"),
//         )
//       );
//   }
}
