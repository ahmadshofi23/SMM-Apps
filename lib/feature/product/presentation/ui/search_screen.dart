import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smm_apps/core/utils/Colors.dart';
import 'package:smm_apps/core/utils/style.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/forecast_chart_screen.dart';
import 'package:smm_apps/feature/product/presentation/bloc/product_bloc.dart';
import 'package:smm_apps/feature/product/presentation/ui/detail_product_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int page = 0;
  String search = '';

  void scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      page++;
      print('page: $page');
      BlocProvider.of<ProductBloc>(context).add(LoadMoreProduct(
        page: page,
      ));
    }
  }

  final _scrollThreshold = 200.0;
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      //this is called many time
      print("limit reached");
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      scrollListener();
    });
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetAllProduct());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            backgroundColor: AppColor().kBackgroundColor,
            body: Padding(
              padding: EdgeInsets.all(kDefaultMargin),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48.h,
                            child: TextFormField(
                              onEditingComplete: () {
                                BlocProvider.of<ProductBloc>(context)
                                    .add(SearchProduct(
                                  keySearch: _searchController.text,
                                ));
                              },
                              onChanged: (value) {
                                BlocProvider.of<ProductBloc>(context)
                                    .add(SearchProduct(
                                  keySearch: _searchController.text,
                                ));
                              },
                              controller: _searchController,
                              decoration: InputDecoration(
                                fillColor: AppColor().kWhiteColor,
                                filled: true,
                                hintText: 'Search products',
                                hintStyle: TextStyle(
                                    color: AppColor().kGreyColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal),
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    BlocProvider.of<ProductBloc>(context).add(
                                        SearchProduct(
                                            keySearch: _searchController.text));
                                  },
                                  icon: const Icon(CupertinoIcons.search),
                                  iconSize: 24.sp,
                                  color: AppColor().kBlackColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(kDefaultRadius),
                                  borderSide: BorderSide(
                                    color: AppColor().kWhiteColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(kDefaultRadius),
                                  borderSide: BorderSide(
                                    color: AppColor().kWhiteColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(kDefaultRadius),
                                  borderSide: BorderSide(
                                    color: AppColor().kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Badge(
                          position: BadgePosition.topEnd(top: 0, end: 3),
                          badgeContent: Text(
                            '1',
                            style: TextStyle(
                                color: AppColor().kWhiteColor, fontSize: 8.sp),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForecastChartScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart_outlined),
                            iconSize: 30.sp,
                            color: AppColor().kGreyColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: kDefaultMargin),
                    _buildListProduct(context),
                  ],
                ),
              ),
            )));
  }

  Widget _buildListProduct(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.isLoading!) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state.listProductResponse!.isEmpty) {
          return const Expanded(
            child: Center(
              child: Text('Data Not Found'),
            ),
          );
        }
        return Expanded(
          child: GridView.builder(
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3.w / 5.h,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: state.listProductResponse?.length,
            itemBuilder: (BuildContext ctx, index) {
              var data = state.listProductResponse![index];
              return GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: RouteSettings(arguments: data),
                      builder: (context) => DetailProductScreen(),
                    ),
                  );
                },
                child: Container(
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor().kWhiteColor,
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: AppColor().kFillCardColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kDefaultRadius),
                            topRight: Radius.circular(kDefaultRadius),
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/picture1.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              softWrap: true,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColor().kTextColor),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Strip | Qty 100",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              data.unitName,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data.expiredDate,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              data.priceLabel,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
