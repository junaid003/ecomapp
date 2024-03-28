part of '../view/home.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
  final catagoriesData = Provider.of<HomeViewModel>(context);
    return Column(
  children: <Widget>[
  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      catagoriesData.productCatagories.title,
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
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: catagoriesData.productCatagories.contents.length,
                    itemBuilder: (context, index) {
                   return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 10),
      child: Container(
        width: 110,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            catagoriesData.productCatagories.contents[index].imageUrl != ""
                  ?
                   Center(
                      child: SizedBox(
                        child: Image.network(
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                           catagoriesData.productCatagories.contents[index].imageUrl),
                      ),
                    )
                  : const SizedBox(),
             
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                  catagoriesData.productCatagories.contents[index].title,
                   style: CommonTextStyles.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ));    
                    },
                  ),
                ),

  ],
);
  }
}
