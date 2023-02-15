import 'lang.dart';
import 'product_color.dart';

class Product {
  final Lang name;
  final Lang brand;
  final Lang desc;
  final String rating;
  final String priceUnit;
  final int price;
  final List<ProductColor> productColorList;

  const Product({
    required this.name,
    required this.brand,
    required this.desc,
    required this.rating,
    required this.priceUnit,
    required this.price,
    required this.productColorList,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: Lang.fromJson(json['name'] ?? {}),
      brand: Lang.fromJson(json['brand'] ?? {}),
      desc: Lang.fromJson(json['desc'] ?? {}),
      rating: json['rating'] ?? '0.0',
      priceUnit: json['priceUnit'] ?? '₩',
      price: json['price'] ?? 0,
      productColorList: (json['colorList'] ?? []).map<ProductColor>((c) {
        return ProductColor.fromJson(c);
      }).toList(),
    );
  }
}
