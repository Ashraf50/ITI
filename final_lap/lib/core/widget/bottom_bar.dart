import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';
import 'package:flutter_application_1/feature/favorite/presentation/view/favorite_view.dart';
import '../../feature/home/presentation/view/home_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;

  void changeItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  final List pages = [
    const HomeView(),
    const FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          pages[currentIndex],
          Positioned(
            bottom: 20,
            left: 70,
            right: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color:
                            currentIndex == 0 ? Colors.white : Colors.white60,
                        size: 25,
                      ),
                      onPressed: () => changeItem(0),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color:
                            currentIndex == 1 ? Colors.white : Colors.white60,
                        size: 25,
                      ),
                      onPressed: () => changeItem(1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
