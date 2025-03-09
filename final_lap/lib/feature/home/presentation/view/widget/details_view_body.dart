import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/core/widget/custom_app_bar.dart';
import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';

class DetailsViewBody extends StatelessWidget {
  final RecipesModel recipe;
  const DetailsViewBody({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: recipe.name!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    recipe.image!,
                    height: 300,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Instructions:',
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(recipe.instructions!.length, (index) {
                  return Text(
                    '${index + 1}. ${recipe.instructions![index]}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Ingredients:',
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(recipe.ingredients!.length, (index) {
                  return Text(
                    '${index + 1}. ${recipe.ingredients![index]}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
