import 'package:catalog_app/data/data_interface/i_products_repository.dart';
import 'package:catalog_app/data/model/product.dart';
import 'package:catalog_app/data/providers/api_provider.dart';
import 'package:catalog_app/data/providers/connectivity_provider.dart';
import 'package:catalog_app/data/providers/db_provider.dart';

class ProductsRepository implements IProductsRepository {
  final ApiProvider _apiProvider;
  final DbProvider _dbProvider;
  final ConnectivityProvider _connectivityProvider;

  ProductsRepository(
    this._apiProvider,
    this._dbProvider,
    this._connectivityProvider,
  );

  @override
  Future<List<Product>> get products async {
    final hasInternet = await _connectivityProvider.hasInternetConnection;

    if (hasInternet) {
      final products = await _apiProvider.fetchProducts();
      if (products == null) throw Exception();

      return products;
    }

    return _dbProvider.products;
  }

  @override
  Future<void> saveProducts(List<Product> products) {
    return _dbProvider.insertProducts(products);
  }
}
