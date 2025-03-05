import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/colors.dart';

class CustomCategory extends StatelessWidget {
  final String text;
  final String where;
  final Color backgroundColor;
  final String picturePath;
  const CustomCategory({
    super.key,
    required this.text,
    required this.where,
    required this.backgroundColor,
    required this.picturePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(picturePath),
        ),
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 20,
            color: Color(0xFF5F6773).withOpacity(0.1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 17, top: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: MColor.black,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: screenWidth / 2 - 60,
              child: Text(
                where,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  height: 17.6 / 16,
                  color: MColor.black,
                ),
              ),
            ),
          ],
        ),

        /* RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: MColor.black,
                  ),
                ),
              ),
              WidgetSpan(
                  child: SizedBox(
                height: 10,
              )),
              TextSpan(
                text: where,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    height: 17.6 / 16,
                    color: MColor.black,
                  ),
                ),
              ),
            ],
          ),
        ), */
      ),
    );
  }
}
