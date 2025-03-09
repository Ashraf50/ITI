import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/db_helper.dart';
import 'package:flutter_application_1/core/widget/custom_app_bar.dart';
import 'package:flutter_application_1/feature/home/data/model/recipes_model/recipes_model.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  List<RecipesModel> savedRecipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    final recipes = await DatabaseHelper.getRecipes();
    setState(() {
      savedRecipes = recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Favorites"),
      body: savedRecipes.isEmpty
          ? const Center(child: Text('no recipes'))
          : ListView.builder(
              itemCount: savedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = savedRecipes[index];
                return ListTile(
                  leading: Image.network(recipe.image!, width: 50, height: 50),
                  title: Text(recipe.name!),
                  subtitle: Text(
                      "⭐ ${recipe.rating} | ⏳ ${recipe.prepTimeMinutes} min"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await DatabaseHelper.deleteRecipe(recipe.id!);
                      _loadRecipes();
                    },
                  ),
                );
              },
            ),
    );
  }
}
