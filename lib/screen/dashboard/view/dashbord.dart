import 'package:ecomapp/screen/account/view/account.dart';
import 'package:ecomapp/screen/cart/view/cart.dart';
import 'package:ecomapp/screen/category/view/category.dart';
import 'package:ecomapp/screen/dashboard/view_model/dashbord_view_model.dart';
import 'package:ecomapp/screen/home/view/home.dart';
import 'package:ecomapp/screen/offers/view/offer.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:provider/provider.dart';


class Dashboard extends StatelessWidget {
 Dashboard({super.key});

   final List<Widget> _bottomNavBarIteam = <Widget>[
    const Home(),
    const CategoryScreen(),
    const CartScreen(),
    const OffersScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final dashboardViewModel = Provider.of<DashboardViewModel>(context);

    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Colors.grey.shade300,
        borderColor: Colors.transparent,
        domeCircleColor: const Color(0xFF92C848),
        curve: Curves.easeIn,
        selectedIndex: dashboardViewModel.selectedIndex,
        onTabChange: (clickedIndex) {
          dashboardViewModel.changeIndex(index: clickedIndex);
        },
        tabs: [
          MoltenTab(
              icon: const Icon(Icons.home),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.window_outlined),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.shopping_cart_rounded),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.local_offer_rounded),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.person),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
        ],
      ),
      body: _bottomNavBarIteam.elementAt(dashboardViewModel.selectedIndex),
    );
  }
}
