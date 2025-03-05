part of 'product_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsInitialError extends ProductsState {
  final String message;
  const ProductsInitialError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductsEmpty extends ProductsState {
  final String emptyListText;
  const ProductsEmpty({required this.emptyListText});

  @override
  List<Object> get props => [emptyListText];
}

class ProductsLoaded extends ProductsState {
  final ProductsModel productsMeal;
  final ProductsModel productsHair;
  final ProductsModel productsShampoo;

  const ProductsLoaded({
    required this.productsMeal,
    required this.productsHair,
    required this.productsShampoo,
  });

  @override
  List<Object?> get props => [productsMeal, productsHair, productsShampoo];
}
