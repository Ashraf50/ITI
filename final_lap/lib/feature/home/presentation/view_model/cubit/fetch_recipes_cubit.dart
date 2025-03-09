import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';
import 'package:flutter_application_1/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'fetch_recipes_state.dart';

class FetchRecipesCubit extends Cubit<FetchRecipesState> {
  HomeRepo homeRepo;
  FetchRecipesCubit(this.homeRepo) : super(FetchRecipesInitial());
  Future<void> fetchAllRecipes() async {
    emit(FetchRecipesLoading());
    try {
      var recipes = await homeRepo.getALlRecipes();
      emit(FetchRecipesSuccess(recipes: recipes));
    } catch (e) {
      emit(FetchRecipesFailure(errMessage: e.toString()));
    }
  }
}
