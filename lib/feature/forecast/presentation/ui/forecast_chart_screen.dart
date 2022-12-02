import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:smm_apps/core/utils/Colors.dart';
import 'package:smm_apps/core/utils/style.dart';
import 'package:smm_apps/core/widget/default_button.dart';
import 'package:smm_apps/feature/forecast/domain/entity/product_cart_entity.dart';
import 'package:smm_apps/feature/forecast/presentation/bloc/bloc/forecast_bloc.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/main_forecast_screen.dart';

class ForecastChartScreen extends StatefulWidget {
  const ForecastChartScreen({Key? key}) : super(key: key);

  @override
  State<ForecastChartScreen> createState() => _ForecastChartScreenState();
}

class _ForecastChartScreenState extends State<ForecastChartScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ForecastBloc>(context).add(GetAllChart());
  }

  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColor().kBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor().kBackgroundColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.arrow_left,
              size: 24,
              color: AppColor().kBlackColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Forecast',
            style: TextStyle(
              color: AppColor().kBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        body: BlocBuilder<ForecastBloc, ForecastState>(
          builder: (context, state) {
            if (state.isLoading!) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.productCart!.isEmpty) {
              return Container();
            } else {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'List Barang',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor().kBlackColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: state.productCart!.length,
                          itemBuilder: (context, index) {
                            var data = state.productCart![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: CardForecastChart(data: data),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Tanggal Forecast',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor().kBlackColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 48,
                        child: TextFormField(
                          controller: date,
                          decoration: InputDecoration(
                            fillColor: AppColor().kWhiteColor,
                            filled: true,
                            hintText: '(DD/MM/YYY)',
                            hintStyle: TextStyle(
                                color: AppColor().kGreyColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            suffixIcon: IconButton(
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2000, 1, 1),
                                    maxTime: DateTime.now(), onChanged: (date) {
                                  print('change $date');
                                }, onConfirm: (dateConfirm) {
                                  setState(() {
                                    date.text =
                                        '${dateConfirm.day} / ${dateConfirm.month} / ${dateConfirm.year}';
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.id);
                              },
                              icon: const Icon(Icons.calendar_month),
                              iconSize: 24,
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
                      const Spacer(),
                      DefaultButton(
                          text: 'Ajukan Forecast',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MainForecastScreen(),
                              ),
                            );
                          }
                          // =>
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ForecastDetailScreen(),
                          //   ),
                          // ),
                          ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class CardForecastChart extends StatelessWidget {
  const CardForecastChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductCart data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      decoration: BoxDecoration(
        color: AppColor().kWhiteColor,
        borderRadius: BorderRadius.circular(kDefaultRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                color: AppColor().kFillCardColor,
                borderRadius: BorderRadius.circular(kDefaultRadius),
              ),
              child: Image.asset(
                "${data.image}",
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name!,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor().kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'NUV792542 - 11/12/24',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor().kFontColorPlaceHolder,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.minus_square,
                            size: 20,
                            color: AppColor().kBlackColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '10',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColor().kBlackColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.plus_square,
                            size: 20,
                            color: AppColor().kBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
