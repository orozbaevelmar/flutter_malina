import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_malina/bloc/navigation/product/product_bloc.dart';
import 'package:flutter_malina/constants/constants.dart';
import 'package:flutter_malina/ui_presentation/screens/components/card.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  _buildButton(text: 'Доставка', hasBorder: false),
                  const SizedBox(width: 10),
                  _buildButton(text: 'В заведении', hasBorder: true),
                ],
              ),
              _buildBloc(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBloc() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return switch (state) {
          ProductsInitial() => const CircularProgressIndicator(),
          ProductsInitialError() => Center(child: Text(state.message)),
          ProductsEmpty() => Center(child: Text(state.emptyListText)),
          ProductsLoaded() => CustomCard(
              category: BasketCategory.meal,
              productsModel: state.productsMeal,
            ),
        };
      },
    );
  }

  Widget _buildButton({required String text, required bool hasBorder}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        height: 40,
        decoration: BoxDecoration(
          color: hasBorder ? MColor.white : MColor.malina,
          borderRadius: BorderRadius.circular(20),
          border: hasBorder ? Border.all(color: Color(0xFFEDEBEB)) : Border(),
        ),
        child: Text(
          text,
          style: MTextStyle.sf_pro_display1(
              hasBorder ? Color(0xFF353535) : MColor.white),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      leading: Icon(
        Icons.arrow_back_ios_new,
        size: 20,
        color: MColor.black1,
      ),
      centerTitle: false,
      title: Text(
        'Корзина',
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
          fontSize: 20,
          height: 23.87 / 20,
          color: MColor.black1,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 28),
          child: Text(
            'Очистить',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 16.71 / 14,
              color: MColor.black1,
            ),
          ),
        )
      ],
    );
  }
}
