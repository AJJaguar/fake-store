import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lyqx_test_task/features/login/presentation/pages/login_page.dart';
import 'package:lyqx_test_task/features/product/data/models/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          Icon(Icons.favorite),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                color: const Color(0XFFF8F7FA),
                child: Image.network(product.image),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(product.category),

                    ///Note:: description not in figma design UI
                    // Text(product.description),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14),
                        SizedBox(width: 4),
                        Text(
                          product.rating.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text('12 Reviews'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                color: Color(0XFFFFE8B2),
                child: Row(
                  children: [
                    SizedBox(
                      height: 48,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0XFF616161),
                            ),
                          ),
                          Text(
                            '\$${product.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 24),
                    AppButton(text: 'Add to cart')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
