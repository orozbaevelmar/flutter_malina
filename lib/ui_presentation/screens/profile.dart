import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Профиль',
        style: MTextStyle.sf_pro_display2(MColor.malina),
      ),
    );
  }
}
