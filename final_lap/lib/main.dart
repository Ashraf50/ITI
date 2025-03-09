import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/bottom_bar.dart';
import 'package:flutter_application_1/feature/home/data/repo/home_repo_impl.dart';
import 'package:flutter_application_1/feature/home/presentation/view_model/cubit/fetch_recipes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchRecipesCubit(HomeRepoImpl())..fetchAllRecipes(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const BottomBar(),
      ),
    );
  }
}
