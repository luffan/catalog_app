import 'package:catalog_app/data/data_interface/i_connectivity_repository.dart';
import 'package:catalog_app/data/providers/connectivity_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityRepository implements IConnectivityRepository {
  final ConnectivityProvider _connectivityProvider;

  ConnectivityRepository(this._connectivityProvider);

  @override
  Stream<ConnectivityResult> get connectivity =>
      _connectivityProvider.connection;
}
