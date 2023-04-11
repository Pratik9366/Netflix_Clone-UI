import 'package:flutter/material.dart';
import 'package:netflix_ui/components/widgets.dart';

import 'package:netflix_ui/json/home_json.dart';
import 'package:netflix_ui/pages/video_detail_page.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({super.key});

  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: const CustomAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      //Poster
                      Container(
                        height: 550,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("lib/images/wednesday.jfif"),
                              fit: BoxFit.cover),
                        ),
                      ),

                      //For 1st & 2nd container mixing with gradiant
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.black.withOpacity(0.30),
                              Colors.black.withOpacity(0)
                            ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter)),
                      ),

                      //Poster title
                      Container(
                        height: 540,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/images/title3.png',
                              width: 300,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Excting - Dark Drama - Thriling Adventure",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Buttons after poster title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //My List button
                      Column(
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "My List",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),

                      // Play button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const VideoDetailPage(
                                      videoUrll: "lib/videos/video_3.mp4")));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 13, left: 8, top: 2, bottom: 2),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Play",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //info button
                      Column(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Info",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //My list-----------------------------------------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "My List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      // My list Scrolling posters
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                              children: List.generate(myList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const VideoDetailPage(
                                            videoUrll:
                                                "lib/videos/video_3.mp4")));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 160,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(myList[index]["img"]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            );
                          })),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //Popular list -------------------------------------------
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Popular on List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      //Popular List Scrolling posters
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                              children:
                                  List.generate(popularList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const VideoDetailPage(
                                            videoUrll:
                                                "lib/video/video_2.mp4")));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 160,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(popularList[index]["img"]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            );
                          })),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //Trending List-------------------------------------------
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Trending Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      //Trending  List Scrolling posters
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                              children:
                                  List.generate(trendingList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const VideoDetailPage(
                                            videoUrll:
                                                "lib/video/video_2.mp4")));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 160,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          trendingList[index]["img"]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            );
                          })),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //Netflix Originals---------------------------------------
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Netflix Originals",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      //Netflix original  List Scrolling posters
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                              children: List.generate(
                                  netflixOriginalList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const VideoDetailPage(
                                            videoUrll:
                                                "lib/video/video_1.mp4")));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 300,
                                width: 165,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          netflixOriginalList[index]["img"]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            );
                          })),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      //Anime list----------------------------------------------
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Anime List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      //Anime List Scrolling posters
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                              children:
                                  List.generate(animeList.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const VideoDetailPage(
                                            videoUrll:
                                                "lib/video/video_2.mp4")));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 160,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(animeList[index]["img"]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            );
                          })),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Header
          ],
        ),
      ),
    );
  }
}
