// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.companyId,
    required this.productId,
    required this.count,
    required this.discount,
    required this.views,
    required this.isPublished,
    required this.price,
    required this.purchases,
    this.createdAt,
    required this.updatedAt,
    required this.afterDiscount,
    required this.priceAfterFee,
    required this.product,
    required this.company,
  });

  int id;
  int companyId;
  int productId;
  int count;
  int discount;
  int views;
  int isPublished;
  int price;
  int purchases;
  var createdAt;
  var updatedAt;
  double afterDiscount;
  double priceAfterFee;
  Product product;
  Company company;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    companyId: json["company_id"],
    productId: json["product_id"],
    count: json["count"],
    discount: json["discount"],
    views: json["views"],
    isPublished: json["isPublished"],
    price: json["price"],
    purchases: json["purchases"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    afterDiscount: json["afterDiscount"].toDouble(),
    priceAfterFee: json["priceAfterFee"].toDouble(),
    product: Product.fromJson(json["product"]),
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "product_id": productId,
    "count": count,
    "discount": discount,
    "views": views,
    "isPublished": isPublished,
    "price": price,
    "purchases": purchases,
    "created_at": createdAt,
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "afterDiscount": afterDiscount,
    "priceAfterFee": priceAfterFee,
    "product": product.toJson(),
    "company": company.toJson(),
  };
}

class Company {
  Company({
    required this.id,
    required this.userId,
    required this.cityId,
    this.mallId,
    required this.bin,
    required this.name,
    required this.code,
    required this.phone,
    required this.description,
    this.image,
    required this.active,
    this.createdAt,
    this.updatedAt,
    this.emailName,
    this.email,
  });

  int id;
  int userId;
  int cityId;
  var mallId;
  String bin;
  NameEnum name;
  NameEnum code;
  String phone;
  String description;
  var image;
  int active;
  var createdAt;
  var updatedAt;
  var emailName;
  var email;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    userId: json["user_id"],
    cityId: json["city_id"],
    mallId: json["mall_id"],
    bin: json["bin"],
    name: nameEnumValues.map[json["name"]],
    code: nameEnumValues.map[json["code"]],
    phone: json["phone"],
    description: json["description"],
    image: json["image"],
    active: json["active"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    emailName: json["email_name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "city_id": cityId,
    "mall_id": mallId,
    "bin": bin,
    "name": nameEnumValues.reverse[name],
    "code": nameEnumValues.reverse[code],
    "phone": phone,
    "description": description,
    "image": image,
    "active": active,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "email_name": emailName,
    "email": email,
  };
}

enum NameEnum { EMPTY, THE_2, THE_3, THE_4, THE_5, THE_7, THE_1, HLEB, CODE, PIT }

final nameEnumValues = EnumValues({
  "Икра": NameEnum.CODE,
  "Яблочный Бутик": NameEnum.EMPTY,
  "hleb": NameEnum.HLEB,
  "Pit": NameEnum.PIT,
  "Бутик 1": NameEnum.THE_1,
  "Бутик 2": NameEnum.THE_2,
  "Бутик 3": NameEnum.THE_3,
  "Бутик 4": NameEnum.THE_4,
  "Бутик 5": NameEnum.THE_5,
  "Бутик 7": NameEnum.THE_7
});

class Product {
  Product({
    required this.id,
    required this.userId,
    required this.categoryId,
    this.brandId,
    required this.countryId,
    required this.measureId,
    required this.title,
    required this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.galleries,
    required this.measure,
    required this.category,
  });

  int id;
  int userId;
  int categoryId;
  var brandId;
  int countryId;
  int measureId;
  String title;
  String description;
  var createdAt;
  var updatedAt;
  var deletedAt;
  List<Gallery> galleries;
  Measure measure;
  Category category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    countryId: json["country_id"],
    measureId: json["measure_id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    galleries: List<Gallery>.from(json["galleries"].map((x) => Gallery.fromJson(x))),
    measure: Measure.fromJson(json["measure"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "brand_id": brandId,
    "country_id": countryId,
    "measure_id": measureId,
    "title": title,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "galleries": List<dynamic>.from(galleries.map((x) => x.toJson())),
    "measure": measure.toJson(),
    "category": category.toJson(),
  };
}

class Category {
  Category({
    required this.id,
    required this.title,
    this.description,
    this.image,
    required this.parentId,
    required this.position,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  var description;
  var image;
  int parentId;
  int position;
  var createdAt;
  var updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    parentId: json["parent_id"],
    position: json["position"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "parent_id": parentId,
    "position": position,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Gallery {
  Gallery({
    required this.id,
    required this.image,
    required this.productId,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String image;
  int productId;
  int userId;
  var createdAt;
  var updatedAt;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["id"],
    image: json["image"],
    productId: json["product_id"],
    userId: json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "product_id": productId,
    "user_id": userId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Measure {
  Measure({
    required this.id,
    required this.title,
    required this.code,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  Title title;
  MeasureCode code;
  var createdAt;
  var updatedAt;

  factory Measure.fromJson(Map<String, dynamic> json) => Measure(
    id: json["id"],
    title: titleValues.map[json["title"]],
    code: measureCodeValues.map[json["code"]],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": titleValues.reverse[title],
    "code": measureCodeValues.reverse[code],
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

enum MeasureCode { EMPTY, CODE, PURPLE, FLUFFY }

final measureCodeValues = EnumValues({
  "шт": MeasureCode.CODE,
  "кг": MeasureCode.EMPTY,
  "гр": MeasureCode.FLUFFY,
  "лтр": MeasureCode.PURPLE
});

enum Title { EMPTY, TITLE, PURPLE, FLUFFY }

final titleValues = EnumValues({
  "Килограммы": Title.EMPTY,
  "Граммы": Title.FLUFFY,
  "Литры": Title.PURPLE,
  "Количество": Title.TITLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
