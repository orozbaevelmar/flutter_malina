import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_malina/constants/colors.dart';
import 'package:flutter_malina/constants/text_style_constant.dart';
import 'package:flutter_malina/ui_presentation/widgets/category.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final List<String> listText = [
    'Вакансии',
    'Маркет',
    'Цветы',
    'Вакансии',
    'Маркет',
    'Цветы',
  ];
  final List<Color> listColor = [
    Color(0xFFD4E5FF),
    Color(0xFFFFD3BA),
    Color(0xFFFFDEDE),
    Color(0xFFD4E5FF),
    Color(0xFFFFD3BA),
    Color(0xFFFFDEDE),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(),
              SizedBox(height: 14),
              _buildQrCode(),
              SizedBox(height: 20),
              CustomCategory(
                text: 'Еда',
                where: 'Из кафе и ресторанов',
                backgroundColor: MColor.yellow,
                picturePath: 'assets/menu/image1.png',
              ),
              SizedBox(height: 20),
              CustomCategory(
                text: 'Бьюти',
                where: 'Салоны красоты и товары',
                backgroundColor: MColor.pink,
                picturePath: 'assets/menu/image2.png',
              ),
              SizedBox(height: 30),
              Text(
                'Скоро в Malina',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  height: 22 / 17,
                  color: MColor.black,
                ),
              ),
              SizedBox(height: 8),
              _buildListView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return SizedBox(
      height: 86,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listText.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(bottom: 6),
          height: 86,
          width: 86,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: listColor[index]),
          child: Text(listText[index],
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 18.2 / 14,
                color: MColor.black,
              )),
        ),
      ),
    );
  }

  Widget _buildQrCode() {
    return Container(
      height: 90,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24),
      //width: double.infinity,
      decoration: BoxDecoration(
        color: MColor.malina,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            width: 36,
            height: 68,
            image: AssetImage(
              'assets/menu/qrCode.png',
            ),
          ),
          SizedBox(width: 17),
          Flexible(
            child: Text(
              'Сканируй QR-код и заказывай прямо в заведении',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: MTextStyle.sf_pro_display1(MColor.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        color: MColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 20,
              color: Color(0xFF5F6773).withOpacity(0.1)),
        ],
      ),
      child: TextField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          hintText: 'Искать в Malina',
          hintStyle: MTextStyle.sf_pro_display(MColor.darkGrey),
          prefixIcon: const Icon(
            Icons.search,
            size: 25,
            weight: 1.39,
            color: MColor.darkGrey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
