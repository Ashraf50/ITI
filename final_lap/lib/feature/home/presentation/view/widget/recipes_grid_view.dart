import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/presentation/view/details_view.dart';
import 'package:flutter_application_1/feature/home/presentation/view/widget/recipe_item.dart';
import 'package:flutter_application_1/feature/home/presentation/view_model/cubit/fetch_recipes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesGridView extends StatelessWidget {
  const RecipesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchRecipesCubit, FetchRecipesState>(
      builder: (context, state) {
        if (state is FetchRecipesSuccess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  (MediaQuery.of(context).size.width ~/ 200).toInt(),
              mainAxisSpacing: 50,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsView(
                        recipe: state.recipes[index],
                      ),
                    ),
                  );
                },
                child: RecipeItem(
                  recipe: state.recipes[index],
                ),
              );
            },
          );
        } else if (state is FetchRecipesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
