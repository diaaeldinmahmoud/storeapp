import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_models.dart';

class GetCategory {
  Future<List<ProductModels>> getCategory({required String category}) async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$category',
    );

    List<ProductModels> products = [];

    for (var item in data) {
      products.add(ProductModels.fromJson(data[item]));
    }
    return products;
  }
}
