import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  int _lastIndex = 2;
  NavBloc() : super(const NavMenuState()) {
    on<NavSwtichEvent>(_onSwitchPage);
  }

  _onSwitchPage(NavSwtichEvent event, emit) {
    if (event.index != _lastIndex) {
      _lastIndex = event.index;
      switch (event.index) {
        case 0:
          emit(NavLentaState());
          break;
        case 1:
          emit(NavFavoriteeState());
          break;
        case 2:
          emit(NavMenuState());
          break;
        case 3:
          emit(NavProfileState());
          break;
        case 4:
          emit(NavBasket1State());
        case 5:
          emit(NavBasket2State());
          break;
      }
    }
  }
}
