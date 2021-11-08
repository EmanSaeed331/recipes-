import 'package:flutter/material.dart';
import 'package:recipies/models/reciepe_api.dart';
import 'package:recipies/models/recipe.dart';
import 'package:recipies/views/widgets/recipes_card.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List <Recipe> _recipes;

bool _isLoaded = true;

@override
  void initState(){
  super.initState();
  getRecipes();
}

Future<void>getRecipes() async{
  _recipes = await ReciepeApi.getRecipe();
  setState(() {
     _isLoaded = false;

  });
print(_recipes);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu,
            color: Colors.black,),
            Text(' Food Recipies',
            style: TextStyle(color:Colors.black),),

          ],
        ),

      ),
      body:
         _isLoaded ? Center(
           child: CircularProgressIndicator())
             :ListView.builder(
           itemCount:_recipes.length,
           itemBuilder: (context , index){
             return RecipeCard(title: _recipes[index].name,
                 cookTime: _recipes[index].totalTime,
                 rating: _recipes[index].rating.toString(),
                 thumbnailUrl: _recipes[index].images,
             );},
         ) ,
         );



  }
}
