import 'package:catalog_app/data/model/category.dart';
import 'package:catalog_app/data/model/product.dart';
import 'package:catalog_app/presentation/model/loading_status.dart';

class HomeState {
  final List<Product> products;
  final bool hasInternet;
  final LoadingStatus loadingStatus;
  final Category currentCategory;

  List<Product> get currentProducts =>
      products.where((product) => product.category == currentCategory).toList();

  HomeState({
    required this.products,
    required this.hasInternet,
    required this.loadingStatus,
    required this.currentCategory,
  });

  HomeState copyWith(
      {List<Product>? products,
      bool? hasInternet,
      LoadingStatus? loadingStatus,
      Category? currentCategory}) {
    return HomeState(
      products: products ?? this.products,
      hasInternet: hasInternet ?? this.hasInternet,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      currentCategory: currentCategory ?? this.currentCategory,
    );
  }
}
