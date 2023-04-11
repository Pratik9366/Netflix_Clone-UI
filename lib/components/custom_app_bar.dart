import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({super.key, this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Color.fromARGB(0, 23, 23, 23).withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10),
              child: Image.asset(
                "lib/images/netflix2.png",
              ),
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBarButtons(
                      title: "TV Showes", onTap: () => debugPrint("TV Showes")),
                  AppBarButtons(
                      title: "Movies", onTap: () => debugPrint("Movies")),
                  AppBarButtons(
                      title: "My List", onTap: () => debugPrint("My List")),
                ],
              ),
            ),

            Row(
              children: [
                const IconButton(
                  onPressed: null, 
                  icon: Icon(
                    Icons.search, color: Colors.white, size: 30,),
                  ),
                  IconButton(
                    onPressed: null, 
                    icon: Image.asset(
                      "lib/images/profile.jpg", fit: BoxFit.cover,height: 20,width: 20,),
                )
              ],
            ),

          ],
        ),
      )
    );
  }
}

class AppBarButtons extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const AppBarButtons({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
