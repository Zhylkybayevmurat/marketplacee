import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_shop/screens/details_screen/widgets/expandable.dart';
import 'package:grocery_shop/screens/shop_screen/shop_screen.dart';

import '../../constants.dart';
import 'widgets/nav_bar.dart';
import 'cart/cart.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List _tabIcons = List.unmodifiable([
    {'icon': 'assets/icons/shop.svg', 'title': 'Shop'},
    {'icon': 'assets/icons/explore.svg', 'title': 'Explore'},
    {'icon': 'assets/icons/cart.svg', 'title': 'Cart'},
    {'icon': 'assets/icons/favorite.svg', 'title': 'Favorites'},
    {'icon': 'assets/icons/account.svg', 'title': 'Account'},
  ]);
  // Here i should change the code from nav_bar_item
  final List<Widget> _tabs = List.unmodifiable([
    ShopScreen(),
    Container(),
    Container(
      child: CartView(
        
      ),
    ),
    Container(),
    Container(),
  ]);

  void onTabChanged(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                  Text(
                    'Marketplace',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.shopping_basket),
                      tooltip: 'Корзина',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('Корзина'),
                                backgroundColor: Colors.red,
                              ),
                              body: CartView(),
                            );
                          },
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                  'Marketplace',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: Text('Main',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Orders',
                  style: TextStyle(
                    fontSize: 18.0,
                  )
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Locations',
                  style: TextStyle(
                    fontSize: 18.0,
                  )
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),




      body: _tabs[currentIndex],
      bottomNavigationBar: NavBar(
        tabIcons: _tabIcons,
        activeIndex: currentIndex,
        onTabChanged: onTabChanged,
      ),
    );
  }
}


