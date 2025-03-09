import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/custom_app_bar.dart';
import 'package:flutter_application_1/feature/home/presentation/view/widget/recipes_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'BreakFast'),
        body: ListView(
          children: const [
            RecipesGridView(),
            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}