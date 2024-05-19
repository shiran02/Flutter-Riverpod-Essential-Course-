import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:provider_lifecycle/pages/async_keep_alive/product_page.dart';
import 'package:provider_lifecycle/pages/async_keep_alive/providers.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prodcutList = ref.watch(getProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: prodcutList.when(
        data: (products) {
          return ListView.separated(
            itemCount: products.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ProductPage(productId: product.id);
                    },
                  ));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${product.id}'),
                  ),
                  title: Text(product.title),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {},
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
