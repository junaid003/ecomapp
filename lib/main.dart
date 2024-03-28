import 'package:ecomapp/screen/dashboard/view_model/dashbord_view_model.dart';
import 'package:ecomapp/screen/home/view_model/home_view_model.dart';
import 'package:ecomapp/screen/splash/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DashboardViewModel()),
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
          ],
          child: MaterialApp(
            home:const SplashScreen(),
            debugShowCheckedModeBanner: false,
            title: 'EcomApp',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          ),
        );
  }
}


