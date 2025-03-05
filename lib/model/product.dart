// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String company;
  String name;
  int price;
  String description;
  Product({
    required this.company,
    required this.name,
    required this.price,
    required this.description,
  });

  static final List<Product> meal = [
    Product(
        company: 'Bellagio Coffee',
        name: 'Том ям',
        price: 250,
        description: 'Пицца с соусом том ям 230 гр fadsfads asfdaf as as')
  ];

  static final List<Product> hair = [
    Product(
      company: 'hair',
      name: 'Hadat Cosmetics',
      price: 1900,
      description:
          'Шампунь интенсивно восстанавливающий Hydro Intensive Repair Shampoo 250 мл',
    ),
    Product(
      company: 'hair',
      name: 'Hadat Cosmetics',
      price: 2000,
      description: 'Увлажняющий кондиционер 150 мл',
    ),
  ];

  static final List<Product> shampoo = [
    Product(
      company: 'Preen Beauty',
      name: 'L’Oreal Paris Elseve',
      price: 250,
      description: 'Шампунь для ослабленных волос',
    ),
  ];
}
