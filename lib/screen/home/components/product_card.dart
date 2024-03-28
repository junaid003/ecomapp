part of '../view/home.dart';


class ProductCard extends StatelessWidget {
  final product productData;
  const ProductCard({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
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
            productData.productImage != ""
                  ? Center(
                      child: SizedBox(
                        child: Image.network(
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                            productData.productImage),
                      ),
                    )
                  : const SizedBox(),
                  productData.discount.isEmpty || productData.discount == '0' ? const SizedBox():
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color:const Color(0xFFFB7B4E),
                      border: Border.all(
                        color:const Color(0xFFFB7B4E),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child:
                     Text(
                    productData.discount.toString(),
                      style: CommonTextStyles.productName,
                    ),
                  ),
                ),
              ),
              Text(
              productData.productName,
               style: CommonTextStyles.productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {},
                    starCount: 5,
                    rating:productData.productRating.toDouble(),
                    size: 13.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.blur_on,
                    color: Colors.amber,
                    borderColor: Colors.amber,
                    spacing: 0.0),
              ),
              Row(
                children: [
                  Text(
                    productData.offerPrice,
                    style: CommonTextStyles.productPrice,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                productData.offerPrice != productData.actualPrice
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                          productData.actualPrice,
                            style: CommonTextStyles.productOldPrice,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
