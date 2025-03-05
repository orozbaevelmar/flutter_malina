import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_malina/bloc/navigation/bloc.dart';
import 'package:flutter_malina/constants/colors.dart';
import 'package:flutter_malina/ui_presentation/widgets/pop_up_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: MColor.white,
        boxShadow: [
          BoxShadow(
            color: MColor.black.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 0,
            offset: Offset(15, 0),
          )
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  navItem(
                    'assets/nav_bar_icons/lenta.png',
                    state.currentIndex == 0,
                    onTap: () => onTap(0),
                    title: 'Лента',
                  ),
                  navItem(
                    'assets/nav_bar_icons/favorite.png',
                    state.currentIndex == 1,
                    onTap: () => onTap(1),
                    title: 'Избранное',
                  ),
                  navItem(
                    'assets/nav_bar_icons/category.png',
                    state.currentIndex == 2,
                    onTap: () => onTap(2),
                    isCenter: true,
                  ),
                  navItem(
                    'assets/nav_bar_icons/person.png',
                    state.currentIndex == 3,
                    onTap: () => onTap(3),
                    title: 'Профиль',
                  ),
                  navItem(
                    'assets/nav_bar_icons/basket.png',
                    state.currentIndex == 4,
                    onTap: () => onTap(4),
                    title: 'Корзина',
                  ),
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
        mainAxisAlignment: MainAxisAlignment.end,
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
}
