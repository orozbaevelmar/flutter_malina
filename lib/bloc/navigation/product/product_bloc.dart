import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_malina/model/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsLoadEvent>(_getProducts);
    on<ProductsDecrementEvent>(_decrementProduct);
    on<ProductsIncrementEvent>(_incrementProduct);
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
    emit(ProductsInitial());
    switch (event.category) {
      case BasketCategory.meal:
        if (productsMeal.results[event.index].howMuch > 0) {
          productsMeal.results[event.index].howMuch--;
          productsMeal.allProductsSumm =
              _summOfAllProductsInOneList(productsMeal.results);
        }
        break;

      case BasketCategory.hair:
        if (productsHair.results[event.index].howMuch > 0) {
          productsHair.results[event.index].howMuch--;
          productsHair.allProductsSumm =
              _summOfAllProductsInOneList(productsHair.results);
        }

        break;

      case BasketCategory.shampoo:
        if (productsShampoo.results[event.index].howMuch > 0) {
          productsShampoo.results[event.index].howMuch--;
          productsShampoo.allProductsSumm =
              _summOfAllProductsInOneList(productsShampoo.results);
        }
        break;
    }
    emit(ProductsLoaded(
      productsMeal: productsMeal,
      productsHair: productsHair,
      productsShampoo: productsShampoo,
    ));
  }

  int _summOfAllProductsInOneList(List<Results> result) {
    int sum = 0;
    for (int i = 0; i < result.length; i++) {
      sum += result[i].howMuch * result[i].price;
    }

    return sum;
  }

  _incrementProduct(ProductsIncrementEvent event, emit) async {
    emit(ProductsInitial());

    switch (event.category) {
      case BasketCategory.meal:
        productsMeal.results[event.index].howMuch++;
        productsMeal.allProductsSumm =
            _summOfAllProductsInOneList(productsMeal.results);
        break;

      case BasketCategory.hair:
        productsHair.results[event.index].howMuch++;
        productsHair.allProductsSumm =
            _summOfAllProductsInOneList(productsHair.results);
        break;

      case BasketCategory.shampoo:
        productsShampoo.results[event.index].howMuch++;
        productsShampoo.allProductsSumm =
            _summOfAllProductsInOneList(productsShampoo.results);
        break;
    }

    emit(ProductsLoaded(
      productsMeal: productsMeal,
      productsHair: productsHair,
      productsShampoo: productsShampoo,
    ));
  }

  _getProducts(ProductsLoadEvent event, emit) async {
    emit(ProductsInitial());
    emit(ProductsLoaded(
      productsMeal: productsMeal,
      productsHair: productsHair,
      productsShampoo: productsShampoo,
    ));
  }
}
