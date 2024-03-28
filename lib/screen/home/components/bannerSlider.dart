part of '../view/home.dart';


class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
  final homeData = Provider.of<HomeViewModel>(context);
    return  CustomCarouselSlider(
                  items: homeData.banners,
                  height: 120,
                  subHeight: 50,
                  width: MediaQuery.of(context).size.width,
                  autoplay: true,
                  showText: false,
                  showSubBackground: false,
                  indicatorShape: BoxShape.circle,
                  selectedDotColor: Colors.white,
                  unselectedDotColor: Colors.grey,
                );
  }
}
