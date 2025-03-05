import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_malina/model/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsLoadEvent>(_getProducts);
    on<ProductsDecrementEvent>(_decrementProduct);
    //on<ProductsFilterEvent>(_getFilter);
    // on<ProductsSearchEvent>(_getSearchedProducts);
    // on<ProductsLoadingEvent>(_loadingIndicator);
    //on<ProductsLoadExistingProductsEvent>(_loadExistingProduct);
  }
  ProductsModel productsMeal = ProductsModel.resultsMeal();
  ProductsModel productsHair = ProductsModel.resultsHair();
  ProductsModel productsShampoo = ProductsModel.resultsShampoo();

  /*  _getFilter(ProductsFilterEvent event, emit) async {
    await _goForwardSearchFilter(event.isInitial, event.url, emit,
        'Не имеестся продуктов в этой категории');
  }

  _getSortedByPriceProducts(ProductsSortByPriceEvent event, emit) async {
    await _goForwardSearchFilter(
        event.isInitial, event.url, emit, 'В каталоге отсутствует продукт');
  } */
  _decrementProduct(ProductsDecrementEvent event, emit) async {
    switch (event.category) {
      case BasketCategory.meal:
        productsMeal.results[event.index].howMuch--;
        break;

      case BasketCategory.hair:
        productsHair.results[event.index].howMuch--;
        break;

      case BasketCategory.shampoo:
        productsShampoo.results[event.index].howMuch--;
        break;
    }
    emit(ProductsLoaded(
      productsMeal: productsMeal,
      productsHair: productsHair,
      productsShampoo: productsShampoo,
    ));
  }

  _incrementProduct(ProductsDecrementEvent event, emit) async {
    switch (event.category) {
      case BasketCategory.meal:
        productsMeal.results[event.index].howMuch++;
        break;

      case BasketCategory.hair:
        productsHair.results[event.index].howMuch++;
        break;

      case BasketCategory.shampoo:
        productsShampoo.results[event.index].howMuch++;
        break;
    }
    emit(ProductsLoaded(
      productsMeal: productsMeal,
      productsHair: productsHair,
      productsShampoo: productsShampoo,
    ));
  }

  _getProducts(ProductsLoadEvent event, emit) async {
    emit(ProductsLoaded(
      productsMeal: productsMeal,
      productsHair: productsHair,
      productsShampoo: productsShampoo,
    ));
  }
}
