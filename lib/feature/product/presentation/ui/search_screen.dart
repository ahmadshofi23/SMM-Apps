import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smm_apps/core/utils/colros.dart';
import 'package:smm_apps/core/utils/style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(kDefaultMargin),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: kWhiteColor,
                          filled: true,
                          hintText: 'Search products',
                          hintStyle: TextStyle(
                              color: kGreyColor, fontWeight: FontWeight.normal),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search_outlined),
                            iconSize: 24,
                            color: kBlackColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                            borderSide: BorderSide(
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined),
                      iconSize: 32,
                      color: kGreyColor,
                    ),
                  ],
                ),
                SizedBox(height: kDefaultMargin),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 4.3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: 10,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius:
                                BorderRadius.circular(kDefaultRadius)),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: kFillCardColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(kDefaultRadius),
                                  topRight: Radius.circular(kDefaultRadius),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "SYRINGE 100UL CD1700",
                                    softWrap: true,
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 14, color: kTextColor),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Strip | Qty 100",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "NUV792542",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "11/02/24",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
