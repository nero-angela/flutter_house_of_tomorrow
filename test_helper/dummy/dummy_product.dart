import 'package:flutter/material.dart';
import 'package:tomorrow_house/model/lang.dart';
import 'package:tomorrow_house/model/product.dart';
import 'package:tomorrow_house/model/product_color.dart';

const Product dummyProduct = Product(
  name: Lang(ko: "3인용 섹션", en: "3-seat section"),
  brand: Lang(ko: "쇠데르함", en: "SÖDERHAMN"),
  desc: Lang(
      ko: "스타일리시하고 산뜻한 느낌이 좋다면 시트가 깊고 넓은 소파는 어떨까요? 개성을 살려 맞춤 구성한 SÖDERHAMN 쇠데르함 소파에 혼자 또는 가족 모두와 함께 앉아 편안한 휴식을 즐겨보세요.",
      en: "If you like the stylish airy look, you have to try the deep generous seats. Create your own personal combination of SÖDERHAMN sofa, then sit down and relax – by yourself or together with the whole family."),
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
    ),
    ProductColor(
      imageUrl:
          "https://i.ibb.co/pRhkW58/03-soederhamn-3-seat-section-tonerud-grey-1057813-pe848995-s5.jpg",
      color: Color(0xFFA4A2A3),
    ),
    ProductColor(
      imageUrl:
          "https://i.ibb.co/ykjRQ7k/04-soederhamn-3-seat-section-fridtuna-light-beige-1057705-pe848919-s5.jpg",
      color: Color(0xFFC4BFB6),
    ),
    ProductColor(
      imageUrl:
          "https://i.ibb.co/DMSS70P/05-soederhamn-3-seat-section-fridtuna-dark-grey-1057701-pe848915-s5.jpg",
      color: Color(0xFF464849),
    )
  ],
);

final List<Product> dummyProductList = [
  const Product(
    name: Lang(ko: "3인용 섹션", en: "3-seat section"),
    brand: Lang(ko: "쇠데르함", en: "SÖDERHAMN"),
    desc: Lang(
        ko: "스타일리시하고 산뜻한 느낌이 좋다면 시트가 깊고 넓은 소파는 어떨까요? 개성을 살려 맞춤 구성한 SÖDERHAMN 쇠데르함 소파에 혼자 또는 가족 모두와 함께 앉아 편안한 휴식을 즐겨보세요.",
        en: "If you like the stylish airy look, you have to try the deep generous seats. Create your own personal combination of SÖDERHAMN sofa, then sit down and relax – by yourself or together with the whole family."),
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
      ),
      ProductColor(
        imageUrl:
            "https://i.ibb.co/pRhkW58/03-soederhamn-3-seat-section-tonerud-grey-1057813-pe848995-s5.jpg",
        color: Color(0xFFA4A2A3),
      ),
      ProductColor(
        imageUrl:
            "https://i.ibb.co/ykjRQ7k/04-soederhamn-3-seat-section-fridtuna-light-beige-1057705-pe848919-s5.jpg",
        color: Color(0xFFC4BFB6),
      ),
      ProductColor(
        imageUrl:
            "https://i.ibb.co/DMSS70P/05-soederhamn-3-seat-section-fridtuna-dark-grey-1057701-pe848915-s5.jpg",
        color: Color(0xFF464849),
      )
    ],
  ),
  const Product(
      name: Lang(ko: "2인용 소파", en: "2-seat sofa"),
      brand: Lang(ko: "페루프", en: "PÄRUP"),
      desc: Lang(
          ko: "이 커버는 폴리에스테르 소재의 GUNNARED/군나레드 원착 패브릭으로 제작되었습니다. 울과 같은 느낌을 지닌 내구성이 우수한 패브릭으로, 따스한 분위기와 투톤의 멜란지 효과가 특징입니다.",
          en: "Do you believe in love at first sight? Sleek design, quick assembly and easy-care with a removable and washable cover make it easy to love PÄRUP sofa. Welcoming to all of your loved ones!"),
      price: 499000,
      priceUnit: "￦",
      rating: "4.8",
      productColorList: [
        ProductColor(
          imageUrl:
              "https://i.ibb.co/D9dg49Y/06-paerup-3-seat-sofa-gunnared-beige-1041904-pe841184-s5.jpg",
          color: Color(0xFFE1DAD1),
        ),
        ProductColor(
          imageUrl:
              "https://i.ibb.co/0B9jMft/07-paerup-3-seat-sofa-vissle-dark-green-1041906-pe841186-s5.jpg",
          color: Color(0xFF4D6452),
        ),
        ProductColor(
          imageUrl:
              "https://i.ibb.co/s5XLCWr/08-paerup-3-seat-sofa-vissle-grey-1041907-pe841187-s5.jpg",
          color: Color(0xFF6E6D71),
        ),
        ProductColor(
          imageUrl:
              "https://i.ibb.co/vw0YyLX/09-paerup-3-seat-sofa-gunnared-dark-grey-1041905-pe841185-s5.jpg",
          color: Color(0xFF4D4D4F),
        )
      ]),
  const Product(
      name: Lang(ko: "4인용소파+긴 의자", en: "4-seat sofa with chaise longue"),
      brand: Lang(ko: "쉬비크", en: "KIVIK"),
      desc: Lang(
          ko: "부드러운 KIVIK 쉬비크 소파의 안락함에 몸을 맡겨 보세요. 넉넉한 크기와 나지막한 팔걸이, 몸에 맞는 형태로 모양을 잡아주는 폼이 들어 있는 포켓스프링 덕분에 집을 찾아온 손님과 함께 오랫동안 앉아서 이야기하고 휴식을 취할 수 있습니다.",
          en: "Cuddle up in the comfortable KIVIK sofa. The generous size, low armrests and pocket springs with foam that adapts to the body invites you and your guests to many hours of socialising and relaxation."),
      price: 1199000,
      priceUnit: "￦",
      rating: "5.0",
      productColorList: [
        ProductColor(
          imageUrl:
              "https://i.ibb.co/9N1hFkv/10-kivik-4-seat-sofa-with-chaise-longue-kelinge-grey-turquoise-1055849-pe848127-s5.jpg",
          color: Color(0xFF4A6767),
        ),
        ProductColor(
          imageUrl:
              "https://i.ibb.co/sPZWb20/11-kivik-4-seat-sofa-with-chaise-longue-hillared-beige-0479988-pe618875-s5.jpg",
          color: Color(0xFFB2A291),
        ),
        ProductColor(
          imageUrl:
              "https://i.ibb.co/LtjXk5h/12-kivik-4-seat-sofa-with-chaise-longue-tibbleby-beige-grey-1056150-pe848283-s5.jpg",
          color: Color(0xFF909090),
        ),
        ProductColor(
          imageUrl:
              "https://i.ibb.co/1Q36Mzy/13-kivik-4-seat-sofa-with-chaise-longue-hillared-anthracite-0479958-pe619110-s5.jpg",
          color: Color(0xFF2F2E32),
        )
      ]),
  const Product(
      name: Lang(ko: "2인용 소파", en: "2-seat sofa"),
      brand: Lang(ko: "리나네스", en: "LINANÄS"),
      desc: Lang(
          ko: "이 커버는 폴리에스테르(폴리에스테르 원착) 소재의 VISSLE/비슬레 패브릭으로 제작됩니다. 매끄러운 직조와 멋진 투톤 효과가 있는 내구성 높은 소재입니다.",
          en: "Cuddle up in the comfortable KIVIK sofa. The generous size, low armrests and pocket springs with foam that adapts to the body invites you and your guests to many hours of socialising and relaxation."),
      price: 299000,
      priceUnit: "￦",
      rating: "5.0",
      productColorList: [
        ProductColor(
          imageUrl:
              "https://i.ibb.co/r5v6ysS/14-linanaes-2-seat-sofa-vissle-beige-0972125-pe811545-s5.jpg",
          color: Color(0xFFD0CBC7),
        ),
        ProductColor(
          imageUrl:
              "https://i.ibb.co/s1Tq9fK/15-linanaes-2-seat-sofa-vissle-dark-grey-0962404-pe808061-s5.jpg",
          color: Color(0xFF504F51),
        )
      ]),
];

const String dummyPrductListJsonString = '''[
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
      },
      {
        "imageUrl": "https://i.ibb.co/pRhkW58/03-soederhamn-3-seat-section-tonerud-grey-1057813-pe848995-s5.jpg",
        "hexColor": "0xFFA4A2A3"
      },
      {
        "imageUrl": "https://i.ibb.co/ykjRQ7k/04-soederhamn-3-seat-section-fridtuna-light-beige-1057705-pe848919-s5.jpg",
        "hexColor": "0xFFC4BFB6"
      },
      {
        "imageUrl": "https://i.ibb.co/DMSS70P/05-soederhamn-3-seat-section-fridtuna-dark-grey-1057701-pe848915-s5.jpg",
        "hexColor": "0xFF464849"
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
      },
      {
        "imageUrl": "https://i.ibb.co/s5XLCWr/08-paerup-3-seat-sofa-vissle-grey-1041907-pe841187-s5.jpg",
        "hexColor": "0xFF6E6D71"
      },
      {
        "imageUrl": "https://i.ibb.co/vw0YyLX/09-paerup-3-seat-sofa-gunnared-dark-grey-1041905-pe841185-s5.jpg",
        "hexColor": "0xFF4D4D4F"
      }
    ]
  },
  {
    "name": {
      "ko": "4인용소파+긴 의자",
      "en": "4-seat sofa with chaise longue"
    },
    "brand": {
      "ko": "쉬비크",
      "en": "KIVIK"
    },
    "desc": {
      "ko": "부드러운 KIVIK 쉬비크 소파의 안락함에 몸을 맡겨 보세요. 넉넉한 크기와 나지막한 팔걸이, 몸에 맞는 형태로 모양을 잡아주는 폼이 들어 있는 포켓스프링 덕분에 집을 찾아온 손님과 함께 오랫동안 앉아서 이야기하고 휴식을 취할 수 있습니다.",
      "en": "Cuddle up in the comfortable KIVIK sofa. The generous size, low armrests and pocket springs with foam that adapts to the body invites you and your guests to many hours of socialising and relaxation."
    },
    "price": 1199000,
    "priceUnit": "￦",
    "rating": "5.0",
    "colorList": [
      {
        "imageUrl": "https://i.ibb.co/9N1hFkv/10-kivik-4-seat-sofa-with-chaise-longue-kelinge-grey-turquoise-1055849-pe848127-s5.jpg",
        "hexColor": "0xFF4A6767"
      },
      {
        "imageUrl": "https://i.ibb.co/sPZWb20/11-kivik-4-seat-sofa-with-chaise-longue-hillared-beige-0479988-pe618875-s5.jpg",
        "hexColor": "0xFFB2A291"
      },
      {
        "imageUrl": "https://i.ibb.co/LtjXk5h/12-kivik-4-seat-sofa-with-chaise-longue-tibbleby-beige-grey-1056150-pe848283-s5.jpg",
        "hexColor": "0xFF909090"
      },
      {
        "imageUrl": "https://i.ibb.co/1Q36Mzy/13-kivik-4-seat-sofa-with-chaise-longue-hillared-anthracite-0479958-pe619110-s5.jpg",
        "hexColor": "0xFF2F2E32"
      }
    ]
  },
  {
    "name": {
      "ko": "2인용 소파",
      "en": "2-seat sofa"
    },
    "brand": {
      "ko": "리나네스",
      "en": "LINANÄS"
    },
    "desc": {
      "ko": "이 커버는 폴리에스테르(폴리에스테르 원착) 소재의 VISSLE/비슬레 패브릭으로 제작됩니다. 매끄러운 직조와 멋진 투톤 효과가 있는 내구성 높은 소재입니다.",
      "en": "Cuddle up in the comfortable KIVIK sofa. The generous size, low armrests and pocket springs with foam that adapts to the body invites you and your guests to many hours of socialising and relaxation."
    },
    "price": 299000,
    "priceUnit": "￦",
    "rating": "5.0",
    "colorList": [
      {
        "imageUrl": "https://i.ibb.co/r5v6ysS/14-linanaes-2-seat-sofa-vissle-beige-0972125-pe811545-s5.jpg",
        "hexColor": "0xFFD0CBC7"
      },
      {
        "imageUrl": "https://i.ibb.co/s1Tq9fK/15-linanaes-2-seat-sofa-vissle-dark-grey-0962404-pe808061-s5.jpg",
        "hexColor": "0xFF504F51"
      }
    ]
  },
  {
    "name": {
      "ko": "2인용 소파",
      "en": "2-seat sofa"
    },
    "brand": {
      "ko": "글로스타드",
      "en": "GLOSTAD"
    },
    "desc": {
      "ko": "작고 귀여운 소파로 좁은 공간에도 잘 어울립니다.",
      "en": "Cuddle up in the comfortable KIVIK sofa. The generous size, low armrests and pocket springs with foam that adapts to the body invites you and your guests to many hours of socialising and relaxation."
    },
    "price": 145000,
    "priceUnit": "￦",
    "rating": "5.0",
    "colorList": [
      {
        "imageUrl": "https://i.ibb.co/DbqmmGL/16-glostad-2-seat-sofa-knisa-medium-blue-0950900-pe800740-s5.jpg",
        "hexColor": "0xFF537285"
      },
      {
        "imageUrl": "https://i.ibb.co/dfm158x/17-glostad-2-seat-sofa-knisa-dark-grey-0950864-pe800736-s5.jpg",
        "hexColor": "0xFF4C4C4C"
      }
    ]
  },
  {
    "name": {
      "ko": "2인용 소파베드",
      "en": "2-seat sofa-bed"
    },
    "brand": {
      "ko": "페루프",
      "en": "PÄRUP"
    },
    "desc": {
      "ko": "빠르고 간편하게 소파를 넓은 침대로 변신시켜보세요.",
      "en": "Do you believe in love at first sight? Sleek design, quick assembly and easy-care with a removable and washable cover make it easy to love PÄRUP sofa. Welcoming to all of your loved ones!"
    },
    "price": 599000,
    "priceUnit": "￦",
    "rating": "5.0",
    "colorList": [
      {
        "imageUrl": "https://i.ibb.co/sy9hgZZ/18-paerup-2-seat-sofa-bed-gunnared-beige-0950156-pe800171-s5.jpg",
        "hexColor": "0xFFE6DED5"
      },
      {
        "imageUrl": "https://i.ibb.co/TMPVFxy/19-paerup-2-seat-sofa-bed-gunnared-dark-grey-0950161-pe800176-s5.jpg",
        "hexColor": "0xFF6B6B6D"
      },
      {
        "imageUrl": "https://i.ibb.co/fSmQVmP/20-paerup-2-seat-sofa-bed-vissle-grey-0950171-pe800185-s5.jpg",
        "hexColor": "0xFF747377"
      }
    ]
  }
]''';
