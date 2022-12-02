import 'package:flutter/material.dart';
import 'package:smm_apps/core/utils/Colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function()? press;
  const DefaultButton({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColor().kOrangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: AppColor().kWhiteColor,
          ),
        ),
      ),
    );
  }
}
