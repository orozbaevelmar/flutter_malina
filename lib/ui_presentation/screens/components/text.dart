import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/colors.dart';
import 'package:flutter_malina/constants/constants.dart';
import 'package:flutter_malina/model/product.dart';

class CustomText extends StatelessWidget {
  final Color textColor;
  const CustomText({
    super.key,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Product.meal[0].name,
          style: MTextStyle.sf_pro_display3(textColor),
        ),
        RichText(
          text: TextSpan(
            style: MTextStyle.sf_pro_display1(textColor),
            children: [
              TextSpan(
                text: '${Product.meal[0].price}',
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
