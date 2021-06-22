import 'package:flutter/material.dart';
import 'package:grocery_shop/models/models.dart';

import '../../../mq.dart';
import 'grocery_item.dart';

class BestSellings extends StatelessWidget {
  BestSellings({
    Key? key,
  }) : super(key: key);

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
