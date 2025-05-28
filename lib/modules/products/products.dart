import 'dart:convert';

class Product {
  final int id;
  final int storeId;
  final String name;
  final String description;
  final double price;
  final String image;
  final int discount;
  final int quantity;


  Product({
    required this.id,
    required this.storeId,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.discount,
    required this.quantity,

  });

  factory Product.fromJson(Map<String, dynamic> json) {

    return Product(
      id: json['id'],
      storeId: json['store_id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      image: json['image'],
      discount: int.parse(json['discount']),
      // discount: json['discount'],
      quantity: json['quantity'],
      // quantity: int.parse(json['quantity']),

    );
  }
}

class ProductsResponse{
  final List<Product> products;
  ProductsResponse({required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json){
    final List<dynamic> productList = json['products'];
    List<Product> products = productList.map((e) => Product.fromJson(e)).toList();

    return ProductsResponse(products: products);
  }
}

