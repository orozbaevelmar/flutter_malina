import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_malina/bloc/navigation/product/product_bloc.dart';
import 'package:flutter_malina/constants/boxShadow.dart';
import 'package:flutter_malina/constants/constants.dart';
import 'package:flutter_malina/model/product.dart';
import 'package:flutter_malina/ui_presentation/screens/components/text.dart';

class CustomCard extends StatelessWidget {
  final BasketCategory category;
  final ProductsModel productsModel;

  const CustomCard({
    super.key,
    required this.productsModel,
    required this.category,
  });

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
          Divider(
            color: Color(0xFFEDEBEB),
            height: 0,
          ),
          SizedBox(height: 12),
          SizedBox(
            height: (130 * productsModel.results.length).toDouble(),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: productsModel.results.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        _buildPicture(
                            imagePath: productsModel.results[index].imagePath),
                        SizedBox(width: 9),
                        _buildNamePriceDescripCount(context,
                            productsModel: productsModel, index: index),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
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
      child: CustomText(
          text: 'Заказать',
          price: productsModel.allProductsSumm.toString(),
          textColor: MColor.white),
    );
  }

  Widget _buildNamePriceDescripCount(BuildContext context,
      {required ProductsModel productsModel, required int index}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: productsModel.results[index].name,
            price: productsModel.results[index].price.toString(),
            textColor: MColor.black1,
          ),
          SizedBox(height: 7),
          Text(
            productsModel.results[index].description,
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
              _buildRemoveAndAddIcon(
                icon: Icons.remove,
                onTap: () {
                  context.read<ProductsBloc>().add(ProductsDecrementEvent(
                      index: index, category: productsModel.category));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.5),
                child: Text(productsModel.results[index].howMuch.toString()),
              ),
              _buildRemoveAndAddIcon(
                icon: Icons.add,
                onTap: () {
                  context.read<ProductsBloc>().add(ProductsIncrementEvent(
                      index: index, category: productsModel.category));
                  /*setState(() {
                    productsModel.results[index].howMuch++;
                  }); */
                },
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

  Widget _buildRemoveAndAddIcon({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: MColor.soft_grey_blue,
          borderRadius: BorderRadius.circular(9.44),
        ),
        child: Icon(
          icon,
          size: 14,
          color: MColor.black1,
        ),
      ),
    );
  }

  Widget _buildPicture({required String imagePath}) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget _buildCompanyName() {
    return Row(
      children: [
        Text(
          productsModel.companyName,
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
