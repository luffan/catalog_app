import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:catalog_app/data/utils/extension/connectivity_extension.dart';

class ConnectivityProvider {
  Stream<ConnectivityResult> get connection =>
      Connectivity().onConnectivityChanged;

  Future<bool> get hasInternetConnection async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.hasInternet;
  }
}
