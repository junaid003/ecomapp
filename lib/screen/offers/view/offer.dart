import 'package:ecomapp/utils/text_style.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Center(
        child: Text(
          "Offers",
          style: CommonTextStyles.navbarItem, 
        ),
      ),
    );
  }
}
