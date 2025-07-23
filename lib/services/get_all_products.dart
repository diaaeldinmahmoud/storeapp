import 'dart:convert';
import 'package:storeapp/helper/api.dart';
import 'package:http/http.dart';
import 'package:storeapp/models/product_models.dart';

class AllProductsService {
  Future<List<ProductModels>> getAllProducts() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
    );

    List<ProductModels> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModels.fromJson(data[i]));
    }
    return productsList;
  }
}
