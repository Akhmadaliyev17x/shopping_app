import 'package:shopping_app/models/product_model.dart';

class BasketElement {
  final Product product;
   int count;

   BasketElement({
    required this.product,
    required this.count,
  });
}
