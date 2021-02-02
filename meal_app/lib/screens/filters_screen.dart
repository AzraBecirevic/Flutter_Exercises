import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegeterian = widget.currentFilters['vegeterian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ){
    return SwitchListTile(
      title: Text(title),
      value: currentValue, 
      subtitle: Text(description),
      onChanged: updateValue,
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegeterian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget> [
          _buildSwitchListTile(
            'Gluten-free', 
            'Only include gluten-free meals',
            _glutenFree, 
            (newValue){
               setState(
                 () {
                   _glutenFree = newValue;
               });
            },
          ),
          _buildSwitchListTile(
            'Lactose-free', 
            'Only include lactose-free meals.',
             _lactoseFree, 
             (newValue){
               setState(
                 () {
                   _lactoseFree = newValue;                 
               });
             }
             ),
              _buildSwitchListTile(
                  'Vegeterian',
                  'Only include vegeterian meals.',
                  _vegeterian,
                  (newValue) {
                    setState(
                      () {
                        _vegeterian = newValue;
                        print(_vegeterian);
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),       
        ],
      ),
    );
  }
}