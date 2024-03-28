import 'package:ecomapp/screen/home/model/category_model.dart';
import 'package:ecomapp/screen/home/model/product_model.dart';
import 'package:ecomapp/screen/home/network/home_api.dart';
import 'package:ecomapp/screen/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

class HomeViewModel extends ChangeNotifier {
  bool loading = true;
  List<dynamic>? response;
  List<Widget> homeWidget =[];
  List<CarouselItem> banners = [];
  String singleBanner = '';
 late Catagories productCatagories;
 late ProductModel  popularProducts; 
 late ProductModel  bestSellProducts;

  getData() async {
    response = await AuthRepository().getData();
    if (response != null) {
      for (var element in response!) {
        if (element["type"] == "banner_slider") {
         homeWidget.add(const BannerSlider());
          for (var element in element["contents"]!) {
            banners.add(
              CarouselItem(
                image: NetworkImage(
                  element["image_url"].toString(),
                ),
              ),
            );
          }
        } else if (element["type"] == "banner_single") {
           homeWidget.add( const SingleBanner());
          singleBanner = element["image_url"];
        } else if (element["type"] == "products" &&
            element["title"] == "Best Sellers") {
         homeWidget.add(const Popular());
         bestSellProducts = ProductModel.fromJson(element);
        } else if (element["type"] == "products" &&
            element["title"] == "Most Popular") {
               homeWidget.add(const Featured());
               popularProducts = ProductModel.fromJson(element);
        }
        else if (element["type"] == "catagories")
         { 
           productCatagories = Catagories.fromJson(element);
           homeWidget.add( const Categories());
        }
      }
      loading = false;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}
