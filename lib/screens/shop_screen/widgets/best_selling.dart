import 'package:flutter/material.dart';
import 'package:grocery_shop/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../mq.dart';
import 'grocery_item.dart';

Future<MGrocery> fetchAlbum() async {
  final response =
  await http.get(Uri.parse('https://smartbazar.kz/api/items/18'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MGrocery.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class BestSellings extends StatefulWidget {
  BestSellings({
    Key? key,
  }) : super(key: key);

  @override
  _BestSellingsState createState() => _BestSellingsState();
}

class _BestSellingsState extends State<BestSellings> {
  late Future<MGrocery> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  final List<MGrocery> _items = [
    MGrocery(
      title: 'Beef Bone',
      description: '500g',
      imageUrl: 'assets/images/beef_bone.png',
      price: 7,
      discount: 4,
      id: 1,
    ),
    MGrocery(
      title: 'Broiler Chicken',
      description: '1kg',
      imageUrl: 'assets/images/chicken.png',
      price: 6,
      discount: 4,
      id: 1,
    ),
    MGrocery(
      title: 'Beef Bone',
      description: '400g',
      imageUrl: 'assets/images/beef_bone.png',
      price: 6,
      discount: 4,
      id: 1,
    ),
    MGrocery(
      title: 'Broiler Chicken',
      description: '1kg',
      imageUrl: 'assets/images/chicken.png',
      price: 6,
      discount: 4,
      id: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQuery.height * 0.3,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (_, i) => GroceryItem(item: _items[i]),
        separatorBuilder: (_, __) => SizedBox(width: 10),
      ),
    );
  }
}
