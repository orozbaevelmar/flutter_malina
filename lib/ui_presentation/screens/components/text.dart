import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/colors.dart';
import 'package:flutter_malina/constants/constants.dart';
import 'package:flutter_malina/model/product.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String price;
  final Color textColor;
  const CustomText({
    super.key,
    required this.text,
    required this.price,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: MTextStyle.sf_pro_display3(textColor),
        ),
        RichText(
          text: TextSpan(
            style: MTextStyle.sf_pro_display1(textColor),
            children: [
              TextSpan(
                text: price,
              ),
              WidgetSpan(child: SizedBox(width: 4.5)),
              TextSpan(
                  text: 'C',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 19.2 / 16,
                    decoration: TextDecoration.underline,
                    color: textColor,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
