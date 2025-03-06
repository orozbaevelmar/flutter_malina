import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_malina/bloc/navigation/bloc.dart';
import 'package:flutter_malina/bloc/navigation/product/product_bloc.dart';
import 'package:flutter_malina/ui_presentation/screens/basket1.dart';
import 'package:flutter_malina/ui_presentation/screens/basket2.dart';
import 'package:flutter_malina/ui_presentation/screens/favorite.dart';
import 'package:flutter_malina/ui_presentation/screens/lenta.dart';
import 'package:flutter_malina/ui_presentation/screens/menu.dart';
import 'package:flutter_malina/ui_presentation/screens/profile.dart';
import 'package:flutter_malina/ui_presentation/widgets/nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(const ProductsLoadEvent());
    var navBloc = context.watch<NavBloc>();
    return Scaffold(
      // extendBody: true,
      body: _switchPage(navBloc.state),
      bottomNavigationBar: NavBar(
        onTap: (int index) => navBloc.state.currentIndex != index
            ? {
                navBloc.add(NavSwtichEvent(index: index)),
              }
            : null,
      ),
    );
  }

  Widget _switchPage(NavState state) {
    if (state is NavLentaState) {
      return const LentaScreen();
    } else if (state is NavFavoriteeState) {
      return const FavoriteScreen();
    } else if (state is NavMenuState) {
      return MenuScreen();
    } else if (state is NavProfileState) {
      return const ProfileScreen();
    } else if (state is NavBasket1State) {
      return Basket1Screen();
    } else if (state is NavBasket2State) {
      return Basket2Screen();
    } else {
      return MenuScreen();
    }
  }
}
