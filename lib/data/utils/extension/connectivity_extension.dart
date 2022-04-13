import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExt on ConnectivityResult {
  bool get hasInternet {
    if (this == ConnectivityResult.mobile || this == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }
}
