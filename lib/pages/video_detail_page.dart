import 'package:flutter/material.dart';
import 'package:netflix_ui/json/video_detail_json.dart';

import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoUrll;
  const VideoDetailPage({super.key, required this.videoUrll});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late VideoPlayerController _controller;
  int activeMenu = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrll)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.collections,
              color: Colors.white,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Image.asset(
              "lib/images/profile.jpg",
              height: 26,
              width: 26,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          //Video container
          Container(
            height: 220,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.2)),
                ),

                //Play, Pause button function
                Center(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying ? null : Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      )),
                ),

                // Preview Button
                Positioned(
                  left: 5,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, top: 8, bottom: 8),
                      child: Row(
                        children: const [
                          Text(
                            "Preview",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //Mute Button
                Positioned(
                  right: 5,
                  bottom: 20,
                  child: Container(
                    height: 35,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_mute,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/netflix2.png",
                  height: 25,
                  width: 25,
                ),
                const Text(
                  "S E R I E S",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            height: size.height - 390,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wednesday',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: 1.4),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '98% match',
                          style: TextStyle(
                              color: Colors.green.withOpacity(0.9),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '2022',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 6, right: 6, top: 4, bottom: 4),
                            child: Text(
                              "U/A 13+",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '1 Season',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 6, right: 6, top: 4, bottom: 4),
                            child: Text(
                              "UHD",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Watch Season 1 Now",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Play",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Download S1:E1",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'S1:E1 Wednesdays Child is Full of Woe',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          height: 1.4),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 30) * 0.75,
                          child: Stack(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.75,
                                height: 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.5)),
                              ),
                              Container(
                                width: (size.width - 30) * 0.2,
                                height: 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "3m remaining",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "In this Coming-of-age mystery series, Wednesday Addams Investigates a series of supernatural murders at Nevermore Academy.",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, height: 1.4),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Starring: Jenna Ortega, Gewndoline Chirstie, Riki Lindhome....more",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 14),
                    ),

                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Creators: Alfred Gough. Miles Miller",
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(likeList.length, (index) {
                      return Column(
                        children: [
                          Icon(
                            likeList[index]["icon"],
                            color: Colors.white.withOpacity(0.9),
                            size: 25,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            likeList[index]['text'],
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      );
                    }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(episodesList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                activeMenu = index;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: activeMenu == index
                                          ? const Border(
                                              top: BorderSide(
                                                  color: Colors.red, width: 4))
                                          : null),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      episodesList[index],
                                      style: TextStyle(
                                          color: activeMenu == index
                                              ? Colors.white.withOpacity(0.8)
                                              : Colors.white.withOpacity(0.5),
                                          fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Season 1",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 17),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(movieList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom:20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: (size.width-30)*0.85,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        color: Colors.black
                                      ),
                                     child: Row(
                                      children: [

                                        Container(
                                          width: 150,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  image: DecorationImage(
                                                    image: AssetImage(movieList[index]["img"]),
                                                    fit: BoxFit.cover)
                                                ),
                                              ),

                                               Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.3)
                                                )
                                              ), 

                                              Positioned(
                                                top: 30,
                                                left: 57,
                                                child: Container(
                                                  width: 38,
                                                  height: 38,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      width: 2,
                                                      color: Colors.white
                                                    )
                                                  ),
                                              
                                                  child: Center(
                                                   child: Icon(
                                                    Icons.play_arrow, color: Colors.white,),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      
                                        Container(
                                          width: (size.width)*0.35,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(movieList[index]["title"],
                                                style: TextStyle(
                                                  fontSize: 15, 
                                                  height: 1.3, 
                                                  fontWeight: FontWeight.bold, 
                                                  color: Colors.white.withOpacity(0.9)),
                                                  ),

                                                  SizedBox(height: 3,),

                                                  Text(movieList[index]["duration"],
                                                  style: TextStyle(
                                                  fontSize: 12, 
                                                  height: 1.3, 
                                                  fontWeight: FontWeight.bold, 
                                                  color: Colors.white.withOpacity(0.5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                     ),
                                    ),
                                   
                                    Container(
                                      width: (size.width-30)*0.15,
                                      decoration: BoxDecoration(
                                        color: Colors.black
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.file_download, 
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5,),

                                Text(movieList[index]["description"], 
                                style: TextStyle(color: Colors.white.withOpacity(0.5), height: 1.4),
                                ),
                              ],
                            ),
                          );
                        }),
                        ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
