part of 'fetch_recipes_cubit.dart';

sealed class FetchRecipesState {}

final class FetchRecipesInitial extends FetchRecipesState {}

final class FetchRecipesLoading extends FetchRecipesState {}

final class FetchRecipesSuccess extends FetchRecipesState {
  List<RecipesModel> recipes;
  FetchRecipesSuccess({required this.recipes});
}

final class FetchRecipesFailure extends FetchRecipesState {
  final String errMessage;
  FetchRecipesFailure({required this.errMessage});
}
