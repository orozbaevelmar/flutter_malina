import 'package:flutter_malina/bloc/navigation/product/product_bloc.dart';

class ProductsModel {
  final String companyName;
  int allProductsSumm;
  final BasketCategory category;
  final List<Results> results;

  ProductsModel({
    required this.companyName,
    required this.allProductsSumm,
    required this.category,
    required this.results,
  });

  static ProductsModel resultsMeal() {
    return ProductsModel(
      companyName: 'Bellagio Coffee',
      allProductsSumm: 250,
      category: BasketCategory.meal,
      results: [
        Results(
          name: 'Том ям',
          price: 250,
          description: 'Пицца с соусом том ям 230 гр fadsfads asfdaf as as',
          howMuch: 1,
          imagePath: 'assets/basket/pizza.png',
        )
      ],
    );
  }

  static ProductsModel resultsHair() {
    return ProductsModel(
      companyName: 'hair',
      allProductsSumm: 1900 + 2000,
      category: BasketCategory.hair,
      results: [
        Results(
            name: 'Hadat Cosmetics',
            price: 1900,
            description:
                'Шампунь интенсивно восстанавливающий Hydro Intensive Repair Shampoo 250 мл',
            howMuch: 1,
            imagePath: 'assets/basket/image1.png'),
        Results(
          name: 'Hadat Cosmetics',
          price: 2000,
          description: 'Увлажняющий кондиционер 150 мл',
          howMuch: 1,
          imagePath: 'assets/basket/image2.png',
        ),
      ],
    );
  }

  static ProductsModel resultsShampoo() {
    return ProductsModel(
      companyName: 'Preen Beauty',
      allProductsSumm: 250,
      category: BasketCategory.shampoo,
      results: [
        Results(
          name: 'L’Oreal Paris Elseve',
          price: 250,
          description: 'Шампунь для ослабленных волос',
          howMuch: 1,
          imagePath: 'assets/basket/image3.png',
        )
      ],
    );
  }
}

class Results {
  String name;
  int price;
  String description;
  int howMuch;
  String imagePath;
  Results({
    required this.name,
    required this.price,
    required this.description,
    required this.howMuch,
    required this.imagePath,
  });
}
