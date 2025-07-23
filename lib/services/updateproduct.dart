import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_models.dart';

class Updateproduct {
  Future<ProductModels> updateProduct({
    required dynamic id,
    required dynamic title,
    required dynamic price,
    required dynamic description,
    required dynamic image,
    required dynamic category,
  }) async {
    Map<String, dynamic> body = {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    };

    Map<dynamic, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: body,
      token: null, // Assuming no token is needed for this API
    );

    return ProductModels.fromJson(data);
  }
}
