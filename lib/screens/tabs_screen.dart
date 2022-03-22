import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'title': 'Categories', 'page': CategoriesScreen()},
    {'title': 'Favourites', 'page': FavoritesScreen()}
  ];
  int _selectedTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedTabIndex]['title'] as String),
        // bottom: const TabBar(tabs: [
        //   Tab(
        //     icon: Icon(Icons.category),
        //     text: "Categories",
        //   ),
        //   Tab(
        //     icon: Icon(Icons.star),
        //     text: "Favourite",
        //   )
        // ]),
      ),
      body: _pages[_selectedTabIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Categories",
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Favourites",
              backgroundColor: Theme.of(context).primaryColor)
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedTabIndex,
        //type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
