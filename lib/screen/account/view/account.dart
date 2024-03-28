import 'package:flutter/material.dart';
import 'package:ecomapp/utils/text_style.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Account",
            style: CommonTextStyles.navbarItem, 
        ),
      ),
    );
  }
}
