import 'package:flutter/material.dart';
import 'package:netflix_ui/json/hot_new_json.dart';

class HotNewPages extends StatefulWidget {
  const HotNewPages({super.key});

  @override
  State<HotNewPages> createState() => _HotNewPagesState();
}

class _HotNewPagesState extends State<HotNewPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      //AappBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Coming Soon",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.collections_bookmark,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "lib/images/profile.jpg",
              height: 26,
              width: 26,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      //Notifications & arrow button
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withOpacity(0.9),
                  size: 22,
                )
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //Coming soon posters
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(hotNewJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(hotNewJson[index]["img"]),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2)),
                            )
                          ],
                        ),
                      ),

                      //Coming soon posters video duration line
                      hotNewJson[index]['duration']
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 2.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.withOpacity(0.7)),
                                    ),
                                    Container(
                                      width: size.width * 0.34,
                                      height: 2.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red.withOpacity(0.7)),
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Container(),

                      const SizedBox(
                        height: 15,
                      ),

                      // Title_img, Reminder button, Info Button
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              hotNewJson[index]["title_img"],
                              width: 120,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.notifications_none_outlined,
                                      size: 28,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Remiend me",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      size: 28,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Info",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      // Release date
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          hotNewJson[index]["data"],
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),


                      //Posters title
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          hotNewJson[index]["title"],
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),


                      //Posters description
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          hotNewJson[index]["description"],
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          hotNewJson[index]["type"],
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5), fontSize: 12, height: 1.4
                          ),
                        ),
                      ),


                    ],
                  ),
                );
              }))
        ],
      ),
    );
  }
}
