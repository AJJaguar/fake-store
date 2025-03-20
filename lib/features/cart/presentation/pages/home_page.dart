import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lyqx_test_task/features/product/data/models/product_model.dart';
import 'package:lyqx_test_task/features/product/presentation/bloc/product_bloc.dart';
// import 'package:practice_1/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductBloc productBloc;
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(const GetProductListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        leading: const AppBarLeadingWidget(
          title: 'Welcome, johnd',
        ),
        actions: const [
          LogoutButton(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    const Text(
                      'Fake Store',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      // Ensures ListView takes available space
                      child: ListView.builder(
                        itemCount: state.products?.length ??
                            0, // Replace with your data length
                        itemBuilder: (context, index) {
                          return ProductWidget(
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
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color(0XFFFFE8B2),
            child: SizedBox(
              child: Icon(Icons.logout, size: 18),
            ),
          ),
          Text(
            'Log out',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class AppBarLeadingWidget extends StatelessWidget {
  final String title;
  const AppBarLeadingWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ProductWidget extends StatefulWidget {
  final ProductModel product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          context.push(
            '/product_details',
            extra: widget.product,
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0XFFF2F2F2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(20.0), //or 15.0
                  //   child: Container(
                  //     height: 70.0,
                  //     width: 70.0,
                  //     color: Color(0xffFF0E58),
                  //     child:
                  //         Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                  //   ),
                  // ),
                  Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), //or 15.0
                      ),
                      child: Image.network(
                        widget.product.image,
                      )),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          widget.product.title,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.product.category,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, size: 14),
                          SizedBox(width: 4),
                          Text(
                            widget.product.rating.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$${widget.product.price.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _isFavorite
                  ? IconButton(
                      icon: const Icon(
                        Icons.favorite_outlined,
                        color: Color(0XFFEB4335),
                      ),
                      // isSelected: _isFavorite,

                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Color(0XFFCBCBD4),
                      ),
                      // isSelected: _isFavorite,

                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
              // Icon(Icons.favorite)
            ],
          ),
        ),
      ),
    );
  }
}
