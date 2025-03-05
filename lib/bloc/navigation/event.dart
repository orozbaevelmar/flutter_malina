part of 'bloc.dart';

sealed class NavEvent extends Equatable {
  const NavEvent();

  @override
  List<Object> get props => [];
}

class NavSwtichEvent extends NavEvent {
  final int index;

  const NavSwtichEvent({required this.index});

  @override
  List<Object> get props => [index];
}

class NavSwtichBackEvent extends NavEvent {}
