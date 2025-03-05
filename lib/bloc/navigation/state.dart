part of 'bloc.dart';

sealed class NavState extends Equatable {
  final int currentIndex;
  const NavState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class NavLentaState extends NavState {
  const NavLentaState({super.currentIndex = 0});
  @override
  List<Object> get props => [super.currentIndex];
}

class NavFavoriteeState extends NavState {
  const NavFavoriteeState({super.currentIndex = 1});

  @override
  List<Object> get props => [super.currentIndex];
}

class NavMenuState extends NavState {
  const NavMenuState({super.currentIndex = 2});

  @override
  List<Object> get props => [super.currentIndex];
}

class NavProfileState extends NavState {
  const NavProfileState({super.currentIndex = 3});

  @override
  List<Object> get props => [super.currentIndex];
}

class NavBasketState extends NavState {
  const NavBasketState({super.currentIndex = 4});

  @override
  List<Object> get props => [super.currentIndex];
}
