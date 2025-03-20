import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyqx_test_task/features/cart/data/models/cart_model.dart';
import 'package:lyqx_test_task/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:lyqx_test_task/features/cart/presentation/pages/home_page.dart';
import 'package:lyqx_test_task/features/login/presentation/pages/login_page.dart';
import 'package:lyqx_test_task/features/product/data/models/product_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const GetCartListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const AppBarLeadingWidget(
            title: 'Cart',
          ),
          actions: const [
            LogoutButton(),
          ],
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.products == null || state.products!.isEmpty) {
              final dummyProduct = ProductModel(
                  title: 'Mens Cotton',
                  price: 55.99,
                  description: 'No Description',
                  category: 'Men\'s clothing',
                  rating: 4.7,
                  image:
                      'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU');

              return Column(
                children: [
                  CartWidget(product: dummyProduct),
                  CartWidget(product: dummyProduct),
                  CartWidget(product: dummyProduct),
                ],
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.products?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CartWidget(
                          product: state.products?[index] as ProductModel,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
        floatingActionButton: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            // color: Color(0XFFFFE8B2),
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  height: 48,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Cart total'), Text('\$165.97')],
                  ),
                ),
                SizedBox(width: 24),
                AppButton(text: 'Checkout')
              ],
            )));
  }
}

class CartWidget extends StatelessWidget {
  final ProductModel product;
  const CartWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      height: 70.0,
                      width: 70.0,
                      child: Image.network(
                        product.image,
                      )),
                  SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.title),

                      QuantityCounter(),
                      // Container(
                      //   height: 36,
                      //   width: 134,
                      //   color: Colors.blue,
                      // )
                    ],
                  )
                ],
              ),
            ),
            Text('\$${product.price.toString()}')
          ],
        ),
      ),
    );
  }
}

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(

            // color: Colors.grey
            color: const Color(0XFFE5E5E5)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: decreaseQuantity,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.remove_circle_outline,
                size: 20,

                /// use the right color
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 36,
            child: VerticalDivider(
              width: 2,
              thickness: 1,
              color: Color(0XFFE5E5E5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$quantity',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 36,
            child: VerticalDivider(
              width: 2,
              thickness: 1,
              color: Color(0XFFE5E5E5),
            ),
          ),
          GestureDetector(
            onTap: increaseQuantity,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.add_circle_outline,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
