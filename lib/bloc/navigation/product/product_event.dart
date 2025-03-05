// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsLoadEvent extends ProductsEvent {
  const ProductsLoadEvent();

  @override
  List<Object> get props => [];
}

class ProductsDecrementEvent extends ProductsEvent {
  final int index;
  final BasketCategory category;
  const ProductsDecrementEvent({
    required this.index,
    required this.category,
  });
}

enum BasketCategory { meal, shampoo, hair }
