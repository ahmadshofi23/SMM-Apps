import 'package:flutter/cupertino.dart';
import 'package:smm_apps/core/utils/colros.dart';
import 'package:smm_apps/core/utils/style.dart';

class CardForecastChart extends StatelessWidget {
  const CardForecastChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      decoration: BoxDecoration(
        color: kWhiteColor,
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
                color: kFillCardColor,
                borderRadius: BorderRadius.circular(kDefaultRadius),
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
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'NUV792542 - 11/12/24',
                      style: TextStyle(
                        fontSize: 12,
                        color: kFontColorPlaceHolder,
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
                            color: kBlackColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '10',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.plus_square,
                            size: 20,
                            color: kBlackColor,
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
