import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_shop/models/models.dart';

import '../../../mq.dart';
import 'grocery_item.dart';

import 'package:http/http.dart' as http;

Future<List<MGrocery>> fetchItem() async {
  final response =
      await http.get(Uri.parse('https://smartbazar.kz/api/items'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final List<MGrocery> _items = await jsonDecode(response.body)
        .map<MGrocery>((item) => MGrocery.fromJson(item))
        .toList();
    return _items;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ExclusiveOffers extends StatelessWidget {
  ExclusiveOffers({
    Key? key,
  }) : super(key: key);

  final Future<List<MGrocery>> _items = fetchItem();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _items,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: MQuery.height * 0.3,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (_, i) => GroceryItem(item: snapshot.data[i]),
              separatorBuilder: (_, __) => SizedBox(width: 10),
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
