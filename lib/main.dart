import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/screens/homepage.dart';
import 'package:storeapp/screens/productpage.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Homepage.id: (context) => const Homepage(),
        Productpage.id: (context) => Productpage(),
      },
      initialRoute: Homepage.id,
    );
  }
}
