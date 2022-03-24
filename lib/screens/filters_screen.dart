import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../models/filter_data.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({ Key? key }) : super(key: key);
  static const routeName = '/filters';
  Filters currentFilter;
  Function saveFilter;
  FiltersScreen(this.currentFilter, this.saveFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
      String title, String subTitle, bool value, Function updateValue) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: updateValue as Function(bool),
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilter.glutenFree;
    _lactoseFree = widget.currentFilter.lactoseFree;
    _vegetarian = widget.currentFilter.vegetarian;
    _vegan = widget.currentFilter.vegan;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = Filters(
                    glutenFree: _glutenFree,
                    lactoseFree: _lactoseFree,
                    vegetarian: _vegetarian,
                    vegan: _vegan);
                widget.saveFilter(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Customize your Meals!",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              _buildSwitchListTile(
                  "Gluten-Free", "only include gluten-free meals", _glutenFree,
                  (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian", "only include vegetarian meals", _vegetarian,
                  (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              _buildSwitchListTile("Vegan", "only include vegan meals", _vegan,
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
              _buildSwitchListTile("Lactose-Free",
                  "only include lactose-free meals", _lactoseFree, (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
