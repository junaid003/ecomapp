part of '../view/home.dart';

class SingleBanner extends StatefulWidget {
  const SingleBanner({super.key});

  @override
  State<SingleBanner> createState() => _SingleBannerState();
}

class _SingleBannerState extends State<SingleBanner> {
  @override
  Widget build(BuildContext context) {
  final homeData = Provider.of<HomeViewModel>(context);
    return homeData.singleBanner != ""
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: Image.network(
                              fit: BoxFit.cover,
                              height: 120,
                              homeData.singleBanner),
                        ),
                      )
                    : const SizedBox();
  }
}
