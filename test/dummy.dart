import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/model/cart_item.dart';
import 'package:house_of_tomorrow/src/model/lang.dart';
import 'package:house_of_tomorrow/src/model/product.dart';
import 'package:house_of_tomorrow/src/model/product_color.dart';

abstract class Dummy {
  static const Product product = Product(
    name: Lang(
      ko: "3인용 섹션",
      en: "3-seat section",
    ),
    brand: Lang(
      ko: "쇠데르함",
      en: "SÖDERHAMN",
    ),
    desc: Lang(
      ko: "스타일리시하고 산뜻한 느낌이 좋다면 시트가 깊고 넓은 소파는 어떨까요? 개성을 살려 맞춤 구성한 SÖDERHAMN 쇠데르함 소파에 혼자 또는 가족 모두와 함께 앉아 편안한 휴식을 즐겨보세요.",
      en: "If you like the stylish airy look, you have to try the deep generous seats. Create your own personal combination of SÖDERHAMN sofa, then sit down and relax – by yourself or together with the whole family.",
    ),
    price: 699000,
    priceUnit: "￦",
    rating: "4.9",
    productColorList: [
      ProductColor(
        imageUrl:
            "https://i.ibb.co/YTRbKqD/01-soederhamn-3-seat-section-gransel-natural-colour-1057493-pe848854-s5.jpg",
        color: Color(0xFFEBE1D8),
      ),
      ProductColor(
        imageUrl:
            "https://i.ibb.co/ZLB8kfW/02-soederhamn-3-seat-section-viarp-beige-brown-0802813-pe768605-s5.jpg",
        color: Color(0xFFCBC7BF),
      )
    ],
  );

  static const String jsonProductList = '''[
    {
      "name": {
        "ko": "3인용 섹션",
        "en": "3-seat section"
      },
      "brand": {
        "ko": "쇠데르함",
        "en": "SÖDERHAMN"
      },
      "desc": {
        "ko": "스타일리시하고 산뜻한 느낌이 좋다면 시트가 깊고 넓은 소파는 어떨까요? 개성을 살려 맞춤 구성한 SÖDERHAMN 쇠데르함 소파에 혼자 또는 가족 모두와 함께 앉아 편안한 휴식을 즐겨보세요.",
        "en": "If you like the stylish airy look, you have to try the deep generous seats. Create your own personal combination of SÖDERHAMN sofa, then sit down and relax – by yourself or together with the whole family."
      },
      "price": 699000,
      "priceUnit": "￦",
      "rating": "4.9",
      "colorList": [
        {
          "imageUrl": "https://i.ibb.co/YTRbKqD/01-soederhamn-3-seat-section-gransel-natural-colour-1057493-pe848854-s5.jpg",
          "hexColor": "0xFFEBE1D8"
        },
        {
          "imageUrl": "https://i.ibb.co/ZLB8kfW/02-soederhamn-3-seat-section-viarp-beige-brown-0802813-pe768605-s5.jpg",
          "hexColor": "0xFFCBC7BF"
        }
      ]
    },
    {
      "name": {
        "ko": "2인용 소파",
        "en": "2-seat sofa"
      },
      "brand": {
        "ko": "페루프",
        "en": "PÄRUP"
      },
      "desc": {
        "ko": "이 커버는 폴리에스테르 소재의 GUNNARED/군나레드 원착 패브릭으로 제작되었습니다. 울과 같은 느낌을 지닌 내구성이 우수한 패브릭으로, 따스한 분위기와 투톤의 멜란지 효과가 특징입니다.",
        "en": "Do you believe in love at first sight? Sleek design, quick assembly and easy-care with a removable and washable cover make it easy to love PÄRUP sofa. Welcoming to all of your loved ones!"
      },
      "price": 499000,
      "priceUnit": "￦",
      "rating": "4.8",
      "colorList": [
        {
          "imageUrl": "https://i.ibb.co/D9dg49Y/06-paerup-3-seat-sofa-gunnared-beige-1041904-pe841184-s5.jpg",
          "hexColor": "0xFFE1DAD1"
        },
        {
          "imageUrl": "https://i.ibb.co/0B9jMft/07-paerup-3-seat-sofa-vissle-dark-green-1041906-pe841186-s5.jpg",
          "hexColor": "0xFF4D6452"
        }
      ]
    }
  ]
  ''';

  static const CartItem cartItem = CartItem(
    product: product,
    colorIndex: 0,
    count: 1,
    isSelected: true,
  );
}
