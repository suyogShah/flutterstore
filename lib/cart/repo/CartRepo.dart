import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:suyogstore/cart/model/cartModel.dart';
import 'package:suyogstore/home/model/productmodel.dart';

class CartRepo {
  static Future<List<CartModel>> fetchPosts() async {
    var client = http.Client();
    List<CartModel> products = [];
    try {
      var response = await client
          .get(Uri.parse('https://fakestoreapi.com/carts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        CartModel product =
            CartModel.fromJson(result[i] as Map<String, dynamic>);
        products.add(product);
      }

      return products ;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}