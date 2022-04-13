import 'package:catalog_app/data/model/product.dart';

abstract class IProductsRepository {
  Future<List<Product>> get products;

  Future<void> saveProducts(List<Product> products);
}
