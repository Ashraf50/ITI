import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';

abstract class HomeRepo {
  Future<List<RecipesModel>> getALlRecipes();
}
