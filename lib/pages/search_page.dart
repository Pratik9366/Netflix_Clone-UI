import 'package:flutter/material.dart';
import 'package:netflix_ui/json/search_json.dart';
import 'package:netflix_ui/pages/video_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(color: Color.fromARGB(255, 207, 199, 199)),
              prefixIcon:
                  Icon(Icons.search, color: Color.fromARGB(255, 183, 174, 174)),
            ),
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(

      //Top searches text
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 18,
          right: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Top Searches",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 12,
            ),

            // Psoters,Titles & buttons containers
            Column(
                children: List.generate(searchJson.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom:10),
                child: Row(
                  children: [
                    Container(
                      width: (size.width - 36) * 0.8,
                      height: 80,
                      //decoration: const BoxDecoration(color: Colors.red),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const VideoDetailPage(videoUrll: "lib/video/video_2.mp4"
                                  )));
                                },
                                child: Container(
                                  width: 120,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: AssetImage(searchJson[index]["img"]), 
                                      fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                             /* Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(color: Colors.red,
                                image: DecorationImage(
                                    image: AssetImage(searchJson[0]["img"])),
                                ),
                              ) */
                            ],
                          ),
                          
                          const SizedBox(width: 10,),

                          Container(
                            width: (size.width - 36) * 0.4,
                            child: Text(searchJson[index]["title"], 
                            style: TextStyle(color: Colors.white.withOpacity(0.8), 
                            fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ],
                      ),
                    ),
                    
                    Container(
                      width: (size.width - 36) * 0.2,
                      height: 80,
                      child: Center(
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: const Center(
                            child: Icon(Icons.play_arrow_rounded, color: Colors.white,),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
