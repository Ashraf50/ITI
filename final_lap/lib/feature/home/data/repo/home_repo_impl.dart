import 'package:flutter_application_1/core/helper/api_helper.dart';
import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';
import 'package:flutter_application_1/feature/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper = ApiHelper();
  @override
  Future<List<RecipesModel>> getALlRecipes() async {
    try {
      var data = await apiHelper.get(endPoint: "https://dummyjson.com/recipes");
      List<RecipesModel> recipesList = [];
      for (var recipe in data["recipes"]) {
        recipesList.add(RecipesModel.fromJson(recipe));
      }
      return recipesList;
    } catch (e) {
      print("Error fetching recipes: $e");
      return [];
    }
  }
}
