import 'dart:ffi';

class ProductModels {
  final dynamic id;
  final dynamic title;
  final dynamic price;
  final dynamic description;
  final dynamic image;

  final String category;

  ProductModels({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

  factory ProductModels.fromJson(json) {
    return ProductModels(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
    );
  }
}

class ratingmodel {
  final num rate;
  final num count;

  ratingmodel({required this.rate, required this.count});

  factory ratingmodel.fromJson(json) {
    return ratingmodel(rate: json['rate'].toDouble(), count: json['count']);
  }
}
