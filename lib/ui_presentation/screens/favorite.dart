import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/colors.dart';
import 'package:flutter_malina/constants/text_style_constant.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Избранное',
        style: MTextStyle.sf_pro_display2(MColor.malina),
      ),
    );
  }
}
