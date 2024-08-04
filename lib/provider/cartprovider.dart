import 'dart:convert';
import 'dart:developer';

import 'package:cart/model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{


  List<Product> providercart = [];

  void addcart(Product product){
providercart.add(product);

 log(providercart.length.toString());
notifyListeners();
  }

  void removecart(Product product){
    providercart .remove(product);
    notifyListeners();

  }

}