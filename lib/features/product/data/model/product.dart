// ignore_for_file: invalid_annotation_target

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
  int? id,
  String? title,
  double? price,
  String? description,
  String? category,
  String? image,
  Rating? rating,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
  double? rate,
  int? count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, Object?> json) =>
      _$RatingFromJson(json);
}
