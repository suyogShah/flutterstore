import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:suyogstore/Login/model/user.dart';


class LoginRepo
{



  static final Dio _dio = Dio();

  static Future<User> login(String username, String password) async {
    try {
      var response = await _dio.post(
        'https://fakestoreapi.com/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
      debugPrint('post : ${response.data}');
      debugPrint('post : ${response.statusMessage}');
      
      var productModel = User.fromJson(response.data);
    

      return productModel;

    } else {
      throw Exception('Invalid Credentails ');
    }
  } catch (e) {
    log('Error: $e');
    throw e;
  }
}
}
 

  
  
