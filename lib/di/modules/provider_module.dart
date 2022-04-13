import 'package:catalog_app/data/providers/api_provider.dart';
import 'package:catalog_app/data/providers/connectivity_provider.dart';
import 'package:catalog_app/data/providers/db_provider.dart';
import 'package:catalog_app/di/modules/i_register_interface.dart';
import 'package:catalog_app/di/locator.dart';

class ProviderModule implements IRegisterInterface {
  Future<DbProvider> get _dbProdiver async {
    final db = DbProvider();
    await db.init();
    return db;
  }

  @override
  Future<void> registerDependencies() async {
    locator.registerSingleton<ApiProvider>(ApiProvider());
    locator.registerSingleton<ConnectivityProvider>(ConnectivityProvider());
    locator.registerSingleton<DbProvider>(await _dbProdiver);
  }
}
