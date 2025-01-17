import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   Map<String, bool> _filters = {
    'gluten':false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals =[];

  void _setFilters(Map<String, bool> filterData){
      setState(() {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where(
          (meal){
            if(_filters['gluten'] && !meal.isGlutenFree){
              return false;
            }
            if(_filters['lactose'] && !meal.isLactoseFree){
              return false;
            }
            if(_filters['vegan']&& !meal.isVegan){
              return false;
            }
            if(_filters['vegeterian'] && !meal.isVegetarian){
              return false;
            }
            return true;
          },
        ).toList();
      });
  }

  void _toogleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add( 
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id){
      return _favoriteMeals.any((meal)=>meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color:  Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color:  Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/':(ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx)=>
        CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx)=>
        MealDetailScreen(_toogleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx)=>
        FiltersScreen(_filters, _setFilters)
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      }
    );
  }
}