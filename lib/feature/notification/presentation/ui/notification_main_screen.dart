import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smm_apps/core/utils/colros.dart';
import 'package:smm_apps/core/utils/style.dart';

class NotificationMainScreen extends StatefulWidget {
  const NotificationMainScreen({Key? key}) : super(key: key);

  @override
  State<NotificationMainScreen> createState() => _NotificationMainScreenState();
}

class _NotificationMainScreenState extends State<NotificationMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Notifications',
          style: TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hari Ini',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      height: 79,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Acc Forecasting',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kBlackColor,
                                  ),
                                ),
                                Text(
                                  '12.03',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kFontColorPlaceHolder,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Forecasting sudah diacc oleh tim admin. Mohon menunggu untuk pengiriman.',
                              style: TextStyle(
                                fontSize: 12,
                                color: kFontColorPlaceHolder,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Kemarin',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      height: 79,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Acc Forecasting',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kBlackColor,
                                  ),
                                ),
                                Text(
                                  '12.03',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kFontColorPlaceHolder,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Forecasting sudah diacc oleh tim admin. Mohon menunggu untuk pengiriman.',
                              style: TextStyle(
                                fontSize: 12,
                                color: kFontColorPlaceHolder,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'September 2022',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      height: 79,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Acc Forecasting',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kBlackColor,
                                  ),
                                ),
                                Text(
                                  '12.03',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kFontColorPlaceHolder,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Forecasting sudah diacc oleh tim admin. Mohon menunggu untuk pengiriman.',
                              style: TextStyle(
                                fontSize: 12,
                                color: kFontColorPlaceHolder,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
