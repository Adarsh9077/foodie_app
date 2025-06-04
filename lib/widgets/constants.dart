import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff6f35a5);

const kPrimaryLightColor = Color(0xfff1e6ff);

const double defaultPadding = 18.0;

class Restaurants {
  String imgUrl, title, location, rating, price;

  Restaurants({
    required this.imgUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
  });
}
