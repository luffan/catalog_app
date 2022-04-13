import 'package:catalog_app/di/modules/cubit_module.dart';
import 'package:catalog_app/di/modules/i_register_interface.dart';
import 'package:catalog_app/di/modules/provider_module.dart';
import 'package:catalog_app/di/modules/repository_module.dart';

Future<void> configureDependencies() async {
  final List<IRegisterInterface> modules = [
    ProviderModule(),
    RepositoryModule(),
    CubitModule(),
  ];

  for (final module in modules) {
    await module.registerDependencies();
  }
}
