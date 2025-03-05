import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/boxShadow.dart';
import 'package:flutter_malina/constants/constants.dart';
import 'package:flutter_malina/model/product.dart';
import 'package:flutter_malina/ui_presentation/screens/components/text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MColor.white,
        boxShadow: [
          MBoxShadow.boxShadow,
        ],
      ),
      child: Column(
        children: [
          _buildCompanyName(),
          SizedBox(height: 6.5),
          SizedBox(height: 6),
          Divider(
            color: Color(0xFFEDEBEB),
            height: 0,
          ),
          SizedBox(height: 12),
          Row(
            children: [
              _buildPicture(),
              SizedBox(width: 9),
              _buildNamePriceDescrip(),
            ],
          ),
          SizedBox(height: 16),
          _buildDobavki(),
          SizedBox(height: 20),
          _buildOrder(),
        ],
      ),
    );
  }

  Widget _buildOrder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MColor.malina,
      ),
      child: CustomText(textColor: MColor.white),

      /* Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Заказать',
            style: MTextStyle.sf_pro_display1(
              MColor.white,
            ),
          ),
          Text(
            '250',
            style: MTextStyle.sf_pro_display1(
              MColor.white,
            ),
          ),
        ],
      ) */
    );
  }

  Widget _buildNamePriceDescrip() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(textColor: MColor.black1),
          SizedBox(height: 7),
          Text(
            Product.meal[0].description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 18.2 / 14,
              color: Color(0xFF777777),
            ),
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: MColor.soft_grey_blue,
                  borderRadius: BorderRadius.circular(9.44),
                ),
                child: Icon(
                  Icons.remove,
                  size: 14,
                  color: MColor.black1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.5),
                child: Text('1'),
              ),
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: MColor.soft_grey_blue,
                  borderRadius: BorderRadius.circular(9.44),
                ),
                child: Icon(
                  Icons.add,
                  size: 14,
                  color: MColor.black1,
                ),
              ),
              Expanded(child: SizedBox()),
              InkWell(
                child: Image.asset(
                  'assets/basket/Delete.png',
                  height: 34,
                  width: 34,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPicture() {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/basket/pizza.png'),
        ),
      ),
    );
  }

  Widget _buildCompanyName() {
    return Row(
      children: [
        Text(
          'Bellagio Coffee',
          style: MTextStyle.sf_pro_display1(Color(0xFF5F5F5F)),
        ),
        SizedBox(width: 8),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: Color(0xFF5F5F5F),
        )
      ],
    );
  }

  Widget _buildDobavki() {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MColor.soft_grey_blue,
      ),
      padding: EdgeInsets.only(left: 16),
      child: ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        contentPadding: EdgeInsets.all(0),
        minVerticalPadding: 0,
        horizontalTitleGap: 8,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: MColor.green),
          ),
          child: Icon(
            Icons.add,
            size: 30,
            color: MColor.green,
          ),
        ),
        title: Text('Добавки'),
      ),
    );
  }
}
