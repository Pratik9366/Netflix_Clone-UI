import 'package:flutter/material.dart';
import 'package:netflix_ui/components/home_bottom_nav.dart';
import 'package:netflix_ui/pages/downloads_page.dart';
import 'package:netflix_ui/pages/home2_page.dart';
import 'package:netflix_ui/pages/hot_new_pages.dart';
import 'package:netflix_ui/pages/search_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  // This selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }  

  //Page to display
  final List<Widget> _pages = [

    //Home page
    const Home2Page(),

    //Hot page
    const HotNewPages(),

    //Search Page
    const SearchPage(),

    //Download Page
    const DownloadsPage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: HomeBottomNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),

      body: _pages[_selectedIndex],
    );
  }
}
