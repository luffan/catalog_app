import 'package:catalog_app/data/model/category.dart';
import 'package:catalog_app/di/locator.dart';
import 'package:catalog_app/presentation/model/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cubit = locator<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.init();
  }

  @override
  void dispose() {
    _cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _cubit,
      listener: (context, curState) {
        if (!curState.hasInternet) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No internet'),
            ),
          );
        }
      },
      listenWhen: (prevState, curState) =>
          prevState.hasInternet && !curState.hasInternet,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text('Products'),
              const SizedBox(height: 16),
              const Divider(height: 4),
              const SizedBox(height: 16),
              _switcherCategories(state),
              const SizedBox(height: 32),
              state.loadingStatus == LoadingStatus.loading
                  ? const CircularProgressIndicator()
                  : _listProduct(state),
            ],
          ),
        );
      },
    );
  }

  Widget _listProduct(HomeState state) {
    final products = state.currentProducts;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (_, index) {
        return _listItem(
          imageUrl: products[index].image,
          title: products[index].title,
          description: products[index].description,
          price: products[index].price.toDouble(),
        );
      },
    );
  }

  Widget _switcherCategories(HomeState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _categoryButton(
          selected: state.currentCategory == Category.electronics,
          category: Category.electronics,
          countProduct: state.products
              .where((product) => product.category == Category.electronics)
              .length,
        ),
        _categoryButton(
          selected: state.currentCategory == Category.jewelery,
          category: Category.jewelery,
          countProduct: state.products
              .where((product) => product.category == Category.jewelery)
              .length,
        ),
      ],
    );
  }

  Widget _categoryButton({
    required bool selected,
    required Category category,
    required int countProduct,
  }) {
    final color = selected ? Colors.blue : Colors.white;
    return GestureDetector(
      onTap: () => _cubit.switchCategory(category),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Text('${category.name}($countProduct)'),
      ),
    );
  }

  Widget _listItem({
    required String imageUrl,
    required String title,
    required String description,
    required double price,
  }) {
    return ListTile(
      leading: Image(
        height: 24,
        width: 24,
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) {
          return const Icon(
            Icons.image,
            size: 24,
          );
        },
        image: NetworkImage(
          imageUrl,
        ),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text('$price \$'),
    );
  }
}
