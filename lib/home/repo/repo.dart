
import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:suyogstore/cart/model/cartModel.dart';


import 'package:suyogstore/home/model/productmodel.dart';

class ProductRepo {

 final Dio _dio = Dio();
  static const shoppingHomeUrl = 'https://fakestoreapi.com/products';

  List<ProductModel> _shoppingHome = [];

  Future<List<ProductModel>> getShoppingItems() async {
    try {
      Response response = await _dio.get(shoppingHomeUrl);
      _shoppingHome.addAll(
          List.from(response.data).map((e) => ProductModel.fromJson(e)));
      return _shoppingHome;
    } catch (e) {
    log(e.toString());
      return [];
    }
  }
   Future<ProductModel?> getShoppingItemById(int id) async {
  try {
    Response response = await _dio.get('$shoppingHomeUrl/$id');
    Map<String, dynamic> responseData = response.data;

    if (responseData != null) {
      ProductModel product = ProductModel.fromJson(responseData);
      debugPrint('post : ${response.data}');
      return product;
    } else {
      return null;
    }
  } catch (e) {
    log(e.toString());
    return null;
  }
}
Future<List<ProductModel>> getShoppingItemsByCategory(String category) async {
  try {
    Response response = await _dio.get('$shoppingHomeUrl/category/$category');
    List<dynamic> responseData = response.data;

    if (responseData != null) {
      List<ProductModel> products = responseData.map((item) => ProductModel.fromJson(item)).toList();
      debugPrint('posts : ${response.data}');
      return products;
    } else {
      return [];
    }
  } catch (e) {
    log(e.toString());
    return [];
  }
}
  

 Future<ProductModel> createShoppingItems(
    String title, double price, String description, String imageUrl, String category) async {
  try {
    Response response = await _dio.post(shoppingHomeUrl, data: {
      'title': title,
      'price': price,
      'description': description,
      'imageurl': imageUrl,
      'category': category,
    });

    if (response.statusCode == 200) {
      debugPrint('post : ${response.data}');
      debugPrint('post : ${response.statusMessage}');
      
      // Assuming ProductModel.fromJson returns an instance of ProductModel
      var productModel = ProductModel.fromJson(response.data);
      print(productModel.category);
      
      // You may want to return a Map<String, dynamic> representation of the product
      return productModel;

    } else {
      throw Exception('Failed to create shopping item');
    }
  } catch (e) {
    log('Error: $e');
    throw e;
  }
}

 Future<CartModel?> addToCart(int userId, String date, List<Products> products) async {
  try{
    final response = await _dio.post(
      'https://fakestoreapi.com/carts', // Replace with your actual API endpoint
      data: {
        'userId': userId,
        'date': date,
        'products': products.map((product) => product.toJson()).toList(),
      },
    );

    if (response.statusCode == 200) {
      debugPrint('post : ${response.data}');
      debugPrint('post : ${response.statusMessage}');
      return CartModel.fromJson(response.data);
      
    } else {
      throw Exception('Failed to add items to the cart');
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
}
