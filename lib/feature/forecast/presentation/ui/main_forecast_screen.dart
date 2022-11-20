import 'package:flutter/material.dart';
import 'package:smm_apps/core/utils/colros.dart';
import 'package:smm_apps/core/utils/style.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/forecast_detail_screen.dart';

class MainForecastScreen extends StatefulWidget {
  const MainForecastScreen({Key? key}) : super(key: key);

  @override
  State<MainForecastScreen> createState() => _MainForecastScreenState();
}

class _MainForecastScreenState extends State<MainForecastScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forecast',
                style: TextStyle(
                  fontSize: 32,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Sedang berlangsung',
                style: TextStyle(
                  fontSize: 16,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 156,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(kDefaultRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '#1127',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '30/10/2022',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kFontColorPlaceHolder,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                              color: kOrangeColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Waiting',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      const Text(
                        'SYRINGE 100UL CD1700, SYRINGE 100UL CD1700\nSYRINGE 100UL CD1700',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      // Expanded(
                      //   child: Stepper(
                      //     type: stepperType,
                      //     // physics: ScrollPhysics(),
                      //     currentStep: _currentStep,
                      //     onStepTapped: (step) => tapped(step),
                      //     // onStepContinue: continued,
                      //     // onStepCancel: cancel,
                      //     steps: <Step>[
                      //       Step(
                      //         title: Text(''),
                      //         content: Container(),
                      //         isActive: _currentStep >= 0,
                      //         state: _currentStep >= 0
                      //             ? StepState.complete
                      //             : StepState.disabled,
                      //       ),
                      //       Step(
                      //         title: new Text(''),
                      //         content: Container(),
                      //         isActive: _currentStep >= 0,
                      //         state: _currentStep >= 1
                      //             ? StepState.complete
                      //             : StepState.disabled,
                      //       ),
                      //       Step(
                      //         title: new Text(''),
                      //         content: Container(),
                      //         isActive: _currentStep >= 0,
                      //         state: _currentStep >= 2
                      //             ? StepState.complete
                      //             : StepState.disabled,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'History',
                style: TextStyle(
                  fontSize: 16,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForecastDetailScreen()));
                },
                child: Container(
                  height: 86,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '#1128',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '30/10/2022',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kFontColorPlaceHolder,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 60,
                              decoration: BoxDecoration(
                                color: kBackgroundDoneButton,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        const Text(
                          'SYRINGE 100UL CD1700, SYRINGE 100UL CD1700\nSYRINGE 100UL CD1700',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
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

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
