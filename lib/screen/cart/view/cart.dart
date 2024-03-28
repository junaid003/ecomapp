import 'package:ecomapp/utils/text_style.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Center(
        child: Text(
          "Cart",
          style: CommonTextStyles.navbarItem, 
        ),
      ),
    );
  }
}
