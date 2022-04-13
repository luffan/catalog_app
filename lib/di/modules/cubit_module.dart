import 'package:catalog_app/data/data_interface/i_connectivity_repository.dart';
import 'package:catalog_app/data/data_interface/i_products_repository.dart';
import 'package:catalog_app/di/locator.dart';
import 'package:catalog_app/presentation/pages/home/home_cubit.dart';

import 'i_register_interface.dart';

class CubitModule implements IRegisterInterface {
  @override
  Future<void> registerDependencies() async {
    locator.registerSingleton<HomeCubit>(
      HomeCubit(
        locator<IConnectivityRepository>(),
        locator<IProductsRepository>(),
      ),
    );
  }
}
