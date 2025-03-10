import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_malina/bloc/navigation/bloc.dart';
import 'package:flutter_malina/constants/colors.dart';
import 'package:flutter_malina/constants/constants.dart';
import 'package:flutter_malina/ui_presentation/widgets/pop_up_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.onTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        color: MColor.white,
        boxShadow: [
          BoxShadow(
            color: MColor.black.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 0,
            offset: Offset(15, 0),
          ),
        ],
      ),
      child: BottomAppBar(
        surfaceTintColor: MColor.white,
        padding: const EdgeInsets.only(
          top: 4,
          left: 20,
          right: 20,
          bottom: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<NavBloc, NavState>(
            builder: (context, state) {
              print('ABCD ==${state.currentIndex}');
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  navItem(
                    'assets/nav_bar_icons/lenta.png',
                    state.currentIndex == 0,
                    onTap: () => widget.onTap(0),
                    title: 'Лента',
                  ),
                  navItem(
                    'assets/nav_bar_icons/favorite.png',
                    state.currentIndex == 1,
                    onTap: () => widget.onTap(1),
                    title: 'Избранное',
                  ),
                  navItem(
                    'assets/nav_bar_icons/category.png',
                    state.currentIndex == 2,
                    onTap: () => widget.onTap(2),
                    isCenter: true,
                  ),
                  navItem(
                    'assets/nav_bar_icons/person.png',
                    state.currentIndex == 3,
                    onTap: () => widget.onTap(3),
                    title: 'Профиль',
                  ),
                  _buildPopUpMenuButton(
                    ctx: context,
                    navItem: navItem1(
                      'assets/nav_bar_icons/basket.png',
                      state.currentIndex == 4 || state.currentIndex == 5,
                      //onTap: () {}, //=> widget.onTap(4),
                      title: 'Корзина',
                    ),
                    onTapMeal: () {
                      widget.onTap(4);
                      Go.back(context);
                      // print('CurrenINDEX222 === ${state.currentIndex}');
                    },
                    onTapProduct: () {
                      //print('CurrenINDEX111 === ${state.currentIndex}');
                      widget.onTap(5);
                      Go.back(context);
                    },
                  ),
                  /* _buildPriceOrder(
                      navItem: navItem1(
                    'assets/nav_bar_icons/basket.png',
                    state.currentIndex == 4,
                    //onTap: () {}, //=> widget.onTap(4),
                    title: 'Корзина',
                  )), */
                  /*  navItem(
                    'assets/nav_bar_icons/basket.png',
                    state.currentIndex == 4,
                    onTap: () => widget.onTap(4),
                    title: 'Корзина',
                  ), */
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget navItem(
    String iconPath,
    bool selected, {
    Function()? onTap,
    String title = '',
    bool isCenter = false,
    VoidCallback? onTapBlocLoad,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: isCenter
                  ? selected
                      ? const EdgeInsets.all(20)
                      : const EdgeInsets.all(9)
                  : EdgeInsets.zero,
              //margin: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
              margin:
                  isCenter ? EdgeInsets.zero : const EdgeInsets.only(bottom: 5),
              decoration: isCenter
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      color: MColor.malina,
                    )
                  : BoxDecoration(),
              height: isCenter ? 72 : 36,
              width: isCenter ? 72 : 36,
              child: isCenter
                  ? Image(
                      height: 48.39,
                      width: 29.03,
                      color: MColor.white,
                      image: AssetImage(
                        selected
                            ? iconPath
                            : 'assets/nav_bar_icons/selected.png',
                      ),
                    )
                  : Image(
                      color: selected ? MColor.malina : MColor.navbarColor,
                      image: AssetImage(iconPath),
                    )),
          if (!isCenter)
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  height: 11.93 / 10,
                  color: MColor.gray,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget navItem1(
    String iconPath,
    bool selected, {
    //Function()? onTap,
    String title = '',
    bool isCenter = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: isCenter
                ? selected
                    ? const EdgeInsets.all(20)
                    : const EdgeInsets.all(9)
                : EdgeInsets.zero,
            //margin: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
            margin:
                isCenter ? EdgeInsets.zero : const EdgeInsets.only(bottom: 5),
            decoration: isCenter
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: MColor.malina,
                  )
                : BoxDecoration(),
            height: isCenter ? 72 : 36,
            width: isCenter ? 72 : 36,
            child: isCenter
                ? Image(
                    height: 48.39,
                    width: 29.03,
                    color: MColor.white,
                    image: AssetImage(
                      selected ? iconPath : 'assets/nav_bar_icons/selected.png',
                    ),
                  )
                : Image(
                    color: selected ? MColor.malina : MColor.navbarColor,
                    image: AssetImage(iconPath),
                  )),
        if (!isCenter)
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 11.93 / 10,
                color: MColor.gray,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFButton(final String pathToIcon, final String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MColor.green,
        borderRadius: BorderRadius.circular(32),
      ),
      child: RichText(
        text: TextSpan(
          style: MTextStyle.sf_pro_display(const Color(0xFFFFFFFF)),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Image.asset(
                pathToIcon,
                height: 12,
              ),
            ),
            TextSpan(
              text: text,
            ),
          ],
        ),
      ),
    );
  }

  /* Widget _buildPopUp({required Widget navItem}) {
    return PopupMenuButton<SampleItem>(
      offset: Offset(10, -120),

      initialValue: selectedItem,
      elevation: 0,
      shadowColor: Colors.red,

      shape: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          borderSide: BorderSide(color: Colors.transparent)),
      constraints: BoxConstraints(maxWidth: 70),
      padding: EdgeInsets.zero,

      onOpened: () {
        print('Opened');
      },
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      color: MColor.white,
      surfaceTintColor: MColor.white,
      child: navItem,
      // _buildFilterButton('assets/images/filter.png', '  По ценам'),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
            value: SampleItem.ascending,
            child: _buildIcon(
                path: 'assets/basket/Food.png',
                text: 'Еда',
                onTap: Go.to(context, BasketScreen()))),
        PopupMenuItem<SampleItem>(
          value: SampleItem.descending,
          child: _buildIcon(
              path: 'assets/basket/Cosmetic.png',
              text: 'Товары',
              onTap: () => Go.to(context, BasketScreen())),
        ),
      ],
    );
  } */

  Widget _buildIcon({
    required String path,
    required String text,
    required VoidCallback onTap,
    required BasketCategory basketCategory,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        //margin: EdgeInsets.all(5),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF5F5F6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              path,
              height: 22,
              width: 22,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                height: 11.93 / 10,
                color: MColor.black1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPopUpMenuButton({
    required BuildContext ctx,
    required Widget navItem,
    required VoidCallback onTapMeal,
    required VoidCallback onTapProduct,
  }) {
    return PopupMenuButton(
      //offset: Offset(15, 100),
      offset: Offset(15, -140),

      padding: EdgeInsets.zero,
      color: Colors.white,

      elevation: 0,
      //offset: const Offset(100, -500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        /* side: const BorderSide(
          color: MColor.green,
        ),  */ // Set border color
      ),

      constraints: BoxConstraints(
        maxHeight: 145,
        maxWidth: 70, //(MediaQuery.of(ctx).size.width - 16 - 16),
        // minWidth: //(MediaQuery.of(ctx).size.width - 16 - 16),
      ),
      child: navItem,
      itemBuilder: (ctx) => [
        PopupMenuWidget(
          height: 100,
          child: Column(
            children: [
              _buildIcon(
                path: 'assets/basket/Food.png',
                text: 'Еда',
                onTap: onTapMeal,
                basketCategory: BasketCategory.meal,
              ),
              SizedBox(height: 10),
              _buildIcon(
                path: 'assets/basket/Cosmetic.png',
                text: 'Товары',
                onTap: onTapProduct,
                basketCategory: BasketCategory.products,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum BasketCategory {
  meal,
  products,
}
