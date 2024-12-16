import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProductColor extends Equatable {
  final String imageUrl;
  final Color color;

  const ProductColor({
    required this.imageUrl,
    required this.color,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      color: Color(int.tryParse(json['hexColor']) ?? 0xFF000000),
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  @override
  List<Object?> get props => [imageUrl, color];
}
