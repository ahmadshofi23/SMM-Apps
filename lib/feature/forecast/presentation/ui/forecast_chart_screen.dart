import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smm_apps/core/utils/colros.dart';
import 'package:smm_apps/core/utils/style.dart';
import 'package:smm_apps/core/widget/default_button.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/card_forecast_chart.dart';

class ForecastChartScreen extends StatefulWidget {
  const ForecastChartScreen({Key? key}) : super(key: key);

  @override
  State<ForecastChartScreen> createState() => _ForecastChartScreenState();
}

class _ForecastChartScreenState extends State<ForecastChartScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.arrow_left,
              size: 24,
              color: kBlackColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Forecast',
            style: TextStyle(
              color: kBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        body: SafeArea(
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
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: CardForecastChart(),
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
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 48,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: kWhiteColor,
                      filled: true,
                      hintText: '(DD/MM/YYY)',
                      hintStyle: TextStyle(
                          color: kGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_month),
                        iconSize: 24,
                        color: kBlackColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        borderSide: BorderSide(
                          color: kWhiteColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        borderSide: BorderSide(
                          color: kWhiteColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                        borderSide: BorderSide(
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                DefaultButton(text: 'Ajukan Forecast', press: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
