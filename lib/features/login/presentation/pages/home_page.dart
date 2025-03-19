import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:practice_1/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: Column(
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
              SizedBox(height: 16),
              ...List.generate(3, (i) {
                final item = ItemModel(
                  image: 'lol',
                  title: '“Awaken, My Love!”',
                  subtitle: 'Childish Gambino',
                  rating: '4.25',
                  amount: '\$19.99',
                );
                return InkWell(
                  onTap: () => GoRouter.of(context).push(
                    '/product_page',
                    extra: item,
                  ),
                  child: ItemWidget(
                    item: item,
                  ),
                );
              })
            ],
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

class ItemModel {
  final String image;
  final String title;
  final String subtitle;
  final String rating;
  final String amount;

  ItemModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.amount,
  });
}

class ItemWidget extends StatefulWidget {
  final ItemModel item;
  const ItemWidget({super.key, required this.item});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 21),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0XFFF2F2F2),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), //or 15.0
              child: Container(
                height: 70.0,
                width: 70.0,
                color: Color(0xffFF0E58),
                child: Icon(Icons.volume_up, color: Colors.white, size: 50.0),
              ),
            ),
            SizedBox(width: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.item.subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(Icons.star, size: 14),
                        Text(
                          widget.item.rating,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      widget.item.amount,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
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
                      )
                // Icon(Icons.favorite)
              ],
            )
          ],
        ),
      ),
    );
  }
}
