import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  HomeBottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: GNav(
        color: const Color.fromARGB(255, 114, 114, 114),
        activeColor: Colors.white.withOpacity(0.8),
        tabBackgroundColor: const Color.fromARGB(255, 15, 14, 14),
        tabBorderRadius: 20,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        gap: 5,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          //Home button
          GButton(
            icon: Icons.home,
            iconSize: 20,
            text: "Home",
          ),

          //Hots
          GButton(
            icon: Icons.play_arrow_rounded,
            iconSize: 20,
            text: "Hot & New",
          ),

          //Search Page
          GButton(
            icon: Icons.search,
            iconSize: 20,
            text: "Search",),

          //Watchlist button
          GButton(
            icon: Icons.download,
            iconSize: 20,
            text: "Downloads",
          ),
        ],
      ),
    );
  }
}
