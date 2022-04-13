import 'package:catalog_app/data/data_interface/i_connectivity_repository.dart';
import 'package:catalog_app/data/data_interface/i_products_repository.dart';
import 'package:catalog_app/data/providers/api_provider.dart';
import 'package:catalog_app/data/providers/connectivity_provider.dart';
import 'package:catalog_app/data/providers/db_provider.dart';
import 'package:catalog_app/data/repository/connectivity_repository.dart';
import 'package:catalog_app/data/repository/products_repository.dart';
import 'package:catalog_app/di/modules/i_register_interface.dart';
import 'package:catalog_app/di/locator.dart';

class RepositoryModule implements IRegisterInterface {
  @override
  Future<void> registerDependencies() async {
    locator.registerSingleton<IConnectivityRepository>(
      ConnectivityRepository(
        locator<ConnectivityProvider>(),
      ),
    );
    locator.registerSingleton<IProductsRepository>(
      ProductsRepository(
        locator<ApiProvider>(),
        locator<DbProvider>(),
        locator<ConnectivityProvider>(),
      ),
    );
  }
}
