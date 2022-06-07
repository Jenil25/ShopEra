import 'package:flutter/material.dart';

class Item {
  Item({
    this.categoryName = "",
    this.isExpanded = false,
    this.isVeg = true,
    this.count = 0,
    this.list,
  });
  String categoryName;
  bool isExpanded;
  bool isVeg;
  int count;
  List<Items> list;
}

//Items = Category.List
class Items {
  Items({
    this.itemName = "",
    this.price = 0,
    this.image,
    this.quantity = 1,
  });
  String itemName;
  int price;
  Image image;
  int quantity;
}

//Restro = Restaurant Details
class Restro {
  String name = "Happiness Restaurant";
  String cuisineTypes = "Fast Food, Punjabi, Chinese";
  String city = "Bilimora";
  double dist = 2.5;
  String deliveryStatus = "OPEN";
  bool isVeg = true;
  bool isNonVeg = false;
}

// List<Items> myCart = [];
