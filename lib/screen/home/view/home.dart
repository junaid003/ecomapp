import 'package:ecomapp/screen/home/model/product_model.dart';
import 'package:ecomapp/screen/home/view_model/home_view_model.dart';
import 'package:ecomapp/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
part '../components/popular.dart';
part '../components/single_banner.dart';
part '../components/featured.dart';
part '../components/product_card.dart';
part '../components/bannerSlider.dart';
part '../components/categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF92C848),
        leading: Image.asset("assets/images/cart.png"),
        title: SizedBox(
          height: 35,
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: _searchController,
            keyboardAppearance: Brightness.light,
            cursorOpacityAnimates: true,
            cursorColor: Colors.green.shade400,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const SizedBox.shrink(),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 10,
                minHeight: 0,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              contentPadding: const EdgeInsets.only(left: 0, top: 0),
              errorMaxLines: 3,
            ),
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 25,
                  )),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  height: 12,
                  width: 12,
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 5, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: homeData.loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF92C848),
              ),
            )
          : homeData.homeWidget.isEmpty ? const Center( child:  Text("something went wrong")):
          ListView(
              children:homeData.homeWidget
          ),
    );
  }
}
