part of '../view/home.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
  final homeData = Provider.of<HomeViewModel>(context);
    return 
     Column(
  children: <Widget>[
  Padding( padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       homeData.popularProducts.title,
                        style: CommonTextStyles.homeTitleText,
                      ),
                      Text(
                        "view all",
                         style: CommonTextStyles.homeviewAll,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: homeData.popularProducts.contents.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          productData:homeData.popularProducts.contents[index]);
                    },
                  ),
                ),

  ],
);
  }
}
