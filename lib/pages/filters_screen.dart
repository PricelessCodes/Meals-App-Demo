import 'package:flutter/material.dart';
import 'package:meals_app/providers/meals.dart';
import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    final filters = Provider.of<Meals>(context, listen: false).filters;
    _glutenFree = filters['gluten-free']!;
    _vegetarian = filters['vegetarian']!;
    _vegan = filters['vegan']!;
    _lactoseFree = filters['lactose-free']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten-free': _glutenFree,
                'lactose-free': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              Provider.of<Meals>(context, listen: false)
                  .setFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Guten-free'),
                  value: _glutenFree,
                  subtitle: const Text('Only include gluten-free meals.'),
                  onChanged: (newBoolValue) => setState(() {
                    _glutenFree = newBoolValue;
                  }),
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  value: _vegetarian,
                  subtitle: const Text('Only include vegetarian meals.'),
                  onChanged: (newBoolValue) => setState(() {
                    _vegetarian = newBoolValue;
                  }),
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  value: _vegan,
                  subtitle: const Text('Only include Vegan meals.'),
                  onChanged: (newBoolValue) => setState(() {
                    _vegan = newBoolValue;
                  }),
                ),
                SwitchListTile(
                  title: const Text('lactose-Free'),
                  value: _lactoseFree,
                  subtitle: const Text('Only include lactose-Free meals.'),
                  onChanged: (newBoolValue) => setState(() {
                    _lactoseFree = newBoolValue;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
