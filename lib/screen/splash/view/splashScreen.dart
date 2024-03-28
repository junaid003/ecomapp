import 'package:ecomapp/screen/dashboard/view/dashbord.dart';
import 'package:ecomapp/screen/dashboard/view_model/dashbord_view_model.dart';
import 'package:ecomapp/screen/home/view_model/home_view_model.dart';
import 'package:ecomapp/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool instance = true;
  @override
  void initState() {
    super.initState();
  }

  navigateToHome(BuildContext context) async {
    Future.delayed( const Duration(seconds : 2 ), () {
      Provider.of<DashboardViewModel>(context, listen: false)
          .changeIndex(index: 0);
      Provider.of<HomeViewModel>(context, listen: false).getData();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  Dashboard()));
    });
  }


  @override
  Widget build(BuildContext context) {
    if (instance) {
      instance = !instance;
      navigateToHome(context);
    }
    return Scaffold(
      backgroundColor: const Color(0xFF92C848),
      body: Center(
        child: Text(
          "ECOM APP",
          style: 
          CommonTextStyles.splashScreenText
        ),
      ),
    );
  }
}
