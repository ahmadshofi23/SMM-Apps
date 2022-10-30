import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smm_apps/core/utils/colros.dart';
import 'package:smm_apps/core/widget/default_button.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/forecast_chart_screen.dart';
import 'package:smm_apps/feature/product/domain/entity/product_entities.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Product;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(CupertinoIcons.arrow_left, size: 24)),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 229,
                  decoration: BoxDecoration(
                    color: kFillCardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/picture1.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${args.name}',
                  style: TextStyle(
                    fontSize: 18,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Detail produk",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Packing',
                      style: TextStyle(
                        fontSize: 16,
                        color: kFontColorPlaceHolder,
                      ),
                    ),
                    const SizedBox(width: 36),
                    Text(
                      'Strip',
                      style: TextStyle(
                        fontSize: 16,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Satuan',
                      style: TextStyle(
                        fontSize: 16,
                        color: kFontColorPlaceHolder,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text(
                      '100 qty per kit',
                      style: TextStyle(
                        fontSize: 16,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Batch',
                      style: TextStyle(
                        fontSize: 16,
                        color: kFontColorPlaceHolder,
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      'NUV792542',
                      style: TextStyle(
                        fontSize: 16,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Exp date',
                      style: TextStyle(
                        fontSize: 16,
                        color: kFontColorPlaceHolder,
                      ),
                    ),
                    SizedBox(width: 28),
                    Text(
                      '11/02/2024',
                      style: TextStyle(
                        fontSize: 16,
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                DefaultButton(
                  text: 'Tambah ke Cart',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForecastChartScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
