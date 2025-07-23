import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product_models.dart';
import 'package:storeapp/services/get_all_products.dart';

import '../widgets/customcard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const String id = 'homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.shopping_cart)),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text('New Trend', style: TextStyle(color: Colors.black)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 65),

        child: FutureBuilder<List<ProductModels>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            List<ProductModels> products = snapshot.data ?? [];
            if (snapshot.hasData) {
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) =>
                    customcard(product: products[index]),
                itemCount: products.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
