import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/helper/db_helper.dart';

class RecipeItem extends StatelessWidget {
  final RecipesModel recipe;
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -70,
            left: 25,
            child: Container(
              width: 155,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      maxLines: 2,
                      recipe.name!,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 4,
                          children: [
                            Text(
                              recipe.rating.toString(),
                              style: const TextStyle(
                                color: AppColor.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.star_rounded,
                              color: AppColor.primary,
                            ),
                          ],
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            const Icon(
                              Icons.alarm,
                              color: AppColor.primary,
                            ),
                            Text(
                              '${recipe.prepTimeMinutes} min',
                              style: const TextStyle(
                                color: AppColor.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                recipe.image!,
                height: 170,
              ),
            ),
          ),
          Positioned(
            right: 25,
            top: 25,
            child: InkWell(
              onTap: () async {
                await DatabaseHelper.insertRecipe(recipe);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('saved')),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'images/favorite.svg',
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
