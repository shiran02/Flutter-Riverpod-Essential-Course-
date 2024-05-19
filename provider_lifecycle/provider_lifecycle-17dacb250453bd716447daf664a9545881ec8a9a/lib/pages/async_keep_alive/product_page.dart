import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_lifecycle/pages/async_keep_alive/providers.dart';
import 'package:bulleted_list/bulleted_list.dart';

class ProductPage extends ConsumerWidget {
  final int productId;
  const ProductPage({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sigleProduct = ref.watch(getProductProvider(productId: productId));
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: sigleProduct.when(
          data: (product) {
            return ListView(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        productId.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    )
                  ],
                ),
                const Divider(),
                BulletedList(
                  listItems: [
                    'brand : ${product.brand}',
                    'price : \$ ${product.price}',
                    'discount(%) : ${product.discountPercentage}',
                    'stock : ${product.stock}',
                    'category : ${product.category}',
                    'description : ${product.description}',
                  ],
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          },
          error: (error, stackTrace) {},
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
