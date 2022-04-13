import 'dart:async';

import 'package:catalog_app/data/data_interface/i_connectivity_repository.dart';
import 'package:catalog_app/data/data_interface/i_products_repository.dart';
import 'package:catalog_app/data/model/category.dart';
import 'package:catalog_app/presentation/model/loading_status.dart';
import 'package:catalog_app/presentation/pages/home/home_state.dart';
import 'package:catalog_app/data/utils/extension/connectivity_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final IConnectivityRepository _connectivityRepository;
  final IProductsRepository _productsRepository;

  StreamSubscription? _connectionSubscription;

  HomeCubit(
    this._connectivityRepository,
    this._productsRepository,
  ) : super(
          HomeState(
            products: [],
            hasInternet: true,
            loadingStatus: LoadingStatus.idle,
            currentCategory: Category.electronics,
          ),
        );

  void init() async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));

    _connectionSubscription = _connectivityRepository.connectivity.listen(
      (connection) {
        emit(
          state.copyWith(
            hasInternet: connection.hasInternet,
          ),
        );
      },
    );

    final products = await _productsRepository.products;

    _productsRepository.saveProducts(products);

    emit(
      state.copyWith(
        products: products,
        loadingStatus: LoadingStatus.idle,
      ),
    );
  }

  void switchCategory(Category category) => emit(
        state.copyWith(
          currentCategory: category,
        ),
      );

  void dispose() {
    _connectionSubscription?.cancel();
  }
}
