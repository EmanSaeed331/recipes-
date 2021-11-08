import 'dart:convert';

import 'package:recipies/models/recipe.dart';
import 'package:http/http.dart' as http;
class ReciepeApi{



  //
  // var axios = require("axios").default;
  //
  // var options = {
  //   method: 'GET',
  //   url: 'https://yummly2.p.rapidapi.com/feeds/auto-complete',
  //   params: {q: 'chicken soup'},
  //   headers: {
  //     'x-rapidapi-host': 'yummly2.p.rapidapi.com',
  //     'x-rapidapi-key': '88b0ce8fb8msh44e2ab806b30ba6p18536fjsn36e45bac1742'
  //   }
  // };
  //
  // axios.request(options).then(function (response) {
  //   console.log(response.data);
  // }).catch(function (error) {
  //   console.error(error);
  // });
  static Future<List <Recipe>> getRecipe() async{
    var uri = Uri.https('yummly2.p.rapidapi.com','/feeds/list',{"limit":"18","start":"0","tag":"list.recipe.popular",});
    final response = await http.get(uri,headers:
    {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '88b0ce8fb8msh44e2ab806b30ba6p18536fjsn36e45bac1742'
    });
    Map data  = jsonDecode(response.body);
    List _temp = [];
    for(var i  in data['feed']){
      _temp.add(i['content']['details']);

    }
    return Recipe.recipeFromSnapShot(_temp);
  }
}