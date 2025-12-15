class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  // ====== DATA DUMMY (sampleData) ======
  static List<Product> sampleData = [
    Product(
      name: 'Croissant Premium',
      price: 25000,
      image: 'assets/products/croissant.jpg',
      description: 'Croissant fresh panggang dengan mentega premium.',
    ),
    Product(
      name: 'Chocolate Roll',
      price: 22000,
      image: 'assets/products/choco_roll.jpg',
      description: 'Roti roll cokelat lembut dengan premium cocoa.',
    ),
    Product(
      name: 'Baguette French',
      price: 30000,
      image: 'assets/products/baguette.jpg',
      description: 'Roti baguette klasik ala Prancis dengan tekstur crunchy.',
    ),
    Product(
      name: 'Strawberry Cake',
      price: 45000,
      image: 'assets/products/strawberry_cake.jpg',
      description: 'Cake stroberi premium dengan whipped cream lembut.',
    ),
  ];
}
