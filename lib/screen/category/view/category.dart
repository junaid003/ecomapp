import 'package:ecomapp/utils/text_style.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Center(
        child: Text(
          "Category",
           style: CommonTextStyles.navbarItem, 
        ),
      ),
    );
  }
}
