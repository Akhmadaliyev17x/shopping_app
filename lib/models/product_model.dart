class Product {
  final String imageUrl;
  final double price;
  final String name;
  final String type;
  final int rate;

  const Product({
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.type,
    required this.rate,
  });



  @override
  String toString() {
    return 'Product{imageUrl: $imageUrl, price: $price, name: $name, type: $type, rate: $rate}\n';
  }
}
