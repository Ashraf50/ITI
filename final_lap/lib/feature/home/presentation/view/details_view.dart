import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';
import 'package:flutter_application_1/feature/home/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final RecipesModel recipe;
  const DetailsView({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody(
      recipe: recipe,
    );
  }
}
