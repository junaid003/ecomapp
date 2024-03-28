import 'package:flutter/material.dart';
class CommonTextStyles {
  static TextStyle splashScreenText = const TextStyle(
      fontFamily: "Poppins", 
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white);

      static TextStyle homeTitleText = const TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontFamily: "Poppins", 
      fontWeight: FontWeight.w400);

      static TextStyle homeviewAll = const TextStyle(
      fontSize: 8,
      color: Colors.black,
      fontFamily: "Poppins", 
      fontWeight: FontWeight.w400);

      static TextStyle productName = const TextStyle(
      fontSize: 10,
      fontFamily: "Poppins", 
      color: Colors.black,
      );

      static TextStyle productPrice = const TextStyle(
      fontSize: 8,
      fontFamily: "Poppins", 
      color: Colors.black,
      );

      static TextStyle productOldPrice = const TextStyle(
      fontSize: 8,
      fontFamily: "Poppins", 
      color: Colors.grey,
      decoration: TextDecoration.lineThrough
      );

      static TextStyle navbarItem = const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontFamily: "Poppins", 
      fontWeight: FontWeight.bold
      );
}
