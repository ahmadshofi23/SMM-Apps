import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smm_apps/core/utils/Colors.dart';
import 'package:smm_apps/core/utils/style.dart';
import 'package:smm_apps/core/widget/default_button.dart';
import 'package:smm_apps/feature/notification/presentation/ui/notification_main_screen.dart';

class ForecastDetailScreen extends StatefulWidget {
  const ForecastDetailScreen({Key? key}) : super(key: key);

  @override
  State<ForecastDetailScreen> createState() => _ForecastDetailScreenState();
}

class _ForecastDetailScreenState extends State<ForecastDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Forecast #1127',
          style: TextStyle(
            color: AppColor().kBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor().kBlackColor,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor().kWhiteColor,
                borderRadius: BorderRadius.circular(kDefaultRadius),
              ),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 10,
                    decoration: BoxDecoration(
                      color: AppColor().kOrangeColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultRadius),
                        bottomLeft: Radius.circular(kDefaultRadius),
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Icon(
                    Icons.alarm_rounded,
                    color: AppColor().kOrangeColor,
                    size: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 4, bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Waiting',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Sedang menunggu acc dari tim admin',
                          style: TextStyle(
                            color: AppColor().kTextColor,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'List Barang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor().kBlackColor,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Container(
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
                                borderRadius:
                                    BorderRadius.circular(kDefaultRadius),
                              ),
                              child: Image.asset(
                                'assets/images/picture1.jpeg',
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
                                      'SYRINGE 100UL CD1700',
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
                                    Text(
                                      'Qty 10 Pcs',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColor().kFontColorPlaceHolder,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            DefaultButton(
                text: 'Goto Notifications',
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationMainScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
