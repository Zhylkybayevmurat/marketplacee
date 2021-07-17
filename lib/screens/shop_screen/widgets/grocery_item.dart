import 'package:flutter/material.dart';
import 'package:grocery_shop/models/models.dart';
import 'package:grocery_shop/screens/details_screen/item_details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../constants.dart';
import '../../../mq.dart';

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

class GroceryItem extends StatefulWidget {
  final MGrocery item;
  const GroceryItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _GroceryItemState createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryItem> {
  late Future<MGrocery> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  void onTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ItemDetailsSreen(item: widget.item)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: MQuery.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(color: kBorderColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<MGrocery>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Hero(
                            tag: widget.item.hashCode,
                            child: Image.asset(
                              widget.item.imageUrl,
                              height: constraints.maxHeight * 0.4,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(snapshot.data!.title, style: kTitleStyle),
                          Text(widget.item.description, style: kDescriptionStyle),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${snapshot.data!.price}',
                                style: kTitleStyle.copyWith(fontWeight: FontWeight.w700),
                              ),
                              Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator(),);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
