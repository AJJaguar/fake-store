import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final num? id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final num rating;

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
      ];
}
