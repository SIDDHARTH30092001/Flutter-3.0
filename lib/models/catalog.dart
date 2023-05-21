import 'dart:convert';

class CatalogModel {
  //static List<Item> items; //THIS IS INITIALIZED DATA IF SET TO NULL , SHOW ERROR ON CONSOLE BUT NOT ON UI, IF AWAIT SET FOR 2 SEC THEN ON UI TOO //SHOWS MUST BE INITIALIZED ERRO
  static List<Item> items = [];
  // static List<Item> items = [
  //   Item(
  //       id: 1,
  //       name: "iPhone (1st gen)",
  //       desc: "Screen:3.5\" Storage:4/8/16GB Processor:APL0098",
  //       price: 15850,
  //       color: "Black,White",
  //       image:
  //           "https://cdn.shopify.com/s/files/1/0067/9903/2402/products/Apple-iPhone-SE-64GB-Silver_430530a5-83c8-43c1-a766-f8b03738dd37.jpg?v=1640442091")
  // ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

//   //2ND CONSTRUCTOR - MAP TO CLASS
//   factory Item.fromMap(Map<String, dynamic> map) {
//     //FACTORY CONSTRUCTOR HELPS TO CHOOSE DOG/CAT
//     return Item(
//       id: map["id"],
//       name: map["name"],
//       desc: map["desc"],
//       price: map["price"],
//       color: map["color"],
//       image: map["image"],
//     );
//   }

// //CLASS TO MAP FOR FUTURE PURPOSE
//   toMap() => {
//         "id": id,
//         "name": name,
//         "desc": desc,
//         "price": price,
//         "color": color,
//         "image": image,
//       };

//DART DATA CLASS EXTENSION -> CTRL+SHIFT+P -> FROM CLASS -> ITEM
  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? 0,
      color: map['color'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
