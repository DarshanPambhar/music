import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

import 'search.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Music(),
  ));
}

class Music extends StatefulWidget {
  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  bool islike = false;
  bool islike1 = false;
  bool islike2 = false;
  bool playis = false;

  bool isplaying = false;
  bool isplaying1 = false;
  bool isplaying2 = false;
  bool audioplayed = false;
  bool audioplayed1 = false;
  bool audioplayed2 = false;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [
                    Color(0xFF352448).withOpacity(0.9),
                    Color(0xFF22223d),
                  ],
                ),
              ), // your body content.
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    colors: [
                      Colors.white38.withOpacity(0.1),
                      Colors.white38.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 68, top: 10),
              child: Container(
                height: 50,
                width: 315,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    colors: [
                      Colors.white38.withOpacity(0.1),
                      Colors.white38.withOpacity(0.1),
                    ],
                  ),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.white38.withOpacity(0.1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.white38.withOpacity(0.1))),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 80),
              child: Text(
                'Trending right now',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 300),
              child: ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Row(
                  children: [
                    Container(
                      height: 230,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: LinearGradient(
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF001243).withOpacity(0.4),
                            Color(0xFF001243).withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 230,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://im.rediff.com/movies/2019/jul/09badshah2.jpg?w=670&h=900,'),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 220, top: 25),
                            child: Icon(Icons.keyboard_control,
                                size: 35, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150, left: 30),
                            child: Container(
                                height: 70,
                                width: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.blue.withOpacity(0.7),
                                      Colors.blue.withOpacity(0.7)
                                    ],
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          'The Dark Side',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Muse Simulation',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          icon: Icon(
                                            isplaying
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                          ),
                                          onPressed: () async {
                                            String audioasset =
                                                "assets/music1.mp3";
                                            ByteData bytes = await rootBundle
                                                .load(audioasset);
                                            Uint8List soundbytes = bytes.buffer
                                                .asUint8List(
                                                    bytes.offsetInBytes,
                                                    bytes.lengthInBytes);
                                            if (!isplaying && !audioplayed) {
                                              int result = await audioPlayer
                                                  .playBytes(soundbytes);

                                              if (result == 1) {
                                                setState(() {
                                                  isplaying = true;
                                                  audioplayed = true;
                                                });
                                              } else {
                                                print(
                                                    "Error while palying  audio");
                                              }
                                            } else if (audioplayed &&
                                                !isplaying) {
                                              int result =
                                                  await audioPlayer.resume();
                                              if (result == 1) {
                                                setState(() {
                                                  isplaying = true;
                                                  audioplayed = true;
                                                  Icons.pause;
                                                });
                                              } else {
                                                print("Error on resume augio");
                                              }
                                            } else {
                                              int result =
                                                  await audioPlayer.pause();
                                              if (result == 1) {
                                                setState(() {
                                                  isplaying = false;
                                                });
                                              } else {
                                                print("Error on pause audio");
                                              }
                                            }
                                          },
                                        )),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 230,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: LinearGradient(
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF001243).withOpacity(0.4),
                            Color(0xFF001243).withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 230,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://im.rediff.com/movies/2019/jul/09badshah2.jpg?w=670&h=900,'),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 220, top: 25),
                            child: Icon(Icons.keyboard_control,
                                size: 35, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150, left: 30),
                            child: Container(
                                height: 70,
                                width: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.blue.withOpacity(0.7),
                                      Colors.blue.withOpacity(0.7)
                                    ],
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          'The Dark Side',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Muse Simulation',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: Icon(isplaying1
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                        onPressed: () async {
                                          String audioasset =
                                              "assets/music2.mp3";
                                          ByteData bytes = await rootBundle.load(
                                              audioasset); //load sound from assets
                                          Uint8List soundbytes = bytes.buffer
                                              .asUint8List(bytes.offsetInBytes,
                                                  bytes.lengthInBytes);
                                          if (!isplaying1 && !audioplayed1) {
                                            int result = await audioPlayer
                                                .playBytes(soundbytes);
                                            if (result == 1) {
                                              //play success
                                              setState(() {
                                                isplaying1 = true;
                                                audioplayed1 = true;
                                              });
                                            } else {
                                              print(
                                                  "Error while playing audio.");
                                            }
                                          } else if (audioplayed1 &&
                                              !isplaying1) {
                                            int result =
                                                await audioPlayer.resume();
                                            if (result == 1) {
                                              //resume success
                                              setState(() {
                                                isplaying1 = true;
                                                audioplayed1 = true;
                                                Icons.pause;
                                              });
                                            } else {
                                              print("Error on resume audio.");
                                            }
                                          } else {
                                            int result =
                                                await audioPlayer.pause();
                                            if (result == 1) {
                                              //pause success
                                              setState(() {
                                                isplaying1 = false;
                                              });
                                            } else {
                                              print("Error on pause audio.");
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 230,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: LinearGradient(
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF001243).withOpacity(0.4),
                            Color(0xFF001243).withOpacity(0.4),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 230,
                            width: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://im.rediff.com/movies/2019/jul/09badshah2.jpg?w=670&h=900,'),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 220, top: 25),
                            child: Icon(Icons.keyboard_control,
                                size: 35, color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150, left: 30),
                            child: Container(
                                height: 70,
                                width: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.blue.withOpacity(0.7),
                                      Colors.blue.withOpacity(0.7)
                                    ],
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          'The Dark Side',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Muse Simulation',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: Icon(isplaying2
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                        onPressed: () async {
                                          String audioasset =
                                              "assets/music3.mp3";
                                          ByteData bytes = await rootBundle.load(
                                              audioasset); //load sound from assets
                                          Uint8List soundbytes = bytes.buffer
                                              .asUint8List(bytes.offsetInBytes,
                                                  bytes.lengthInBytes);
                                          if (!isplaying2 && !audioplayed2) {
                                            int result = await audioPlayer
                                                .playBytes(soundbytes);
                                            if (result == 1) {
                                              //play success
                                              setState(() {
                                                isplaying2 = true;
                                                audioplayed2 = true;
                                              });
                                            } else {
                                              print(
                                                  "Error while playing audio.");
                                            }
                                          } else if (audioplayed2 &&
                                              !isplaying2) {
                                            int result =
                                                await audioPlayer.resume();
                                            if (result == 1) {
                                              //resume success
                                              setState(() {
                                                isplaying2 = true;
                                                audioplayed2 = true;
                                                Icons.pause;
                                              });
                                            } else {
                                              print("Error on resume audio.");
                                            }
                                          } else {
                                            int result =
                                                await audioPlayer.pause();
                                            if (result == 1) {
                                              //pause success
                                              setState(() {
                                                isplaying2 = false;
                                              });
                                            } else {
                                              print("Error on pause audio.");
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 10),
              child: DefaultTabController(
                length: 6,
                child: Column(
                  children: <Widget>[
                    ButtonsTabBar(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF4a358a),
                            Color(0xFF4a358a),
                          ],
                        ),
                      ),
                      unselectedLabelStyle: TextStyle(color: Colors.white),
                      unselectedBackgroundColor: Color(0xFF22223d),
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          text: "Trending right now",
                        ),
                        Tab(
                          text: "Rock",
                        ),
                        Tab(
                          text: "Hip Hop",
                        ),
                        Tab(
                          text: "Electro",
                        ),
                        Tab(
                          text: "Jazz",
                        ),
                        Tab(
                          text: "Classic",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          SizedBox(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () async {
                                      String audioasset =
                                          "music/Badshah_-Fly_Shehnaaz_Gill_Uchana_Amit_D_Soldierz__Official_Video_2021(128k).mp3";
                                      ByteData bytes = await rootBundle.load(
                                          audioasset); //load sound from assets
                                      Uint8List soundbytes = bytes.buffer
                                          .asUint8List(bytes.offsetInBytes,
                                              bytes.lengthInBytes);
                                      if (!isplaying && !audioplayed) {
                                        int result = await audioPlayer
                                            .playBytes(soundbytes);
                                        if (result == 1) {
                                          //play success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                          });
                                        } else {
                                          print("Error while playing audio.");
                                        }
                                      } else if (audioplayed && !isplaying) {
                                        int result = await audioPlayer.resume();
                                        if (result == 1) {
                                          //resume success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                            Icons.pause;
                                          });
                                        } else {
                                          print("Error on resume audio.");
                                        }
                                      } else {
                                        int result = await audioPlayer.pause();
                                        if (result == 1) {
                                          //pause success
                                          setState(() {
                                            isplaying = false;
                                          });
                                        } else {
                                          print("Error on pause audio.");
                                        }
                                      }
                                    },
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(
                                          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      '''i'm Good(Blue)''',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      'David Guetta & Bebe Rexha',
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                          islike
                                              ? Icons.favorite_border
                                              : Icons.favorite,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(
                                          () {
                                            islike = !islike;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  ListTile(
                                    onTap: () async {
                                      String audioasset =
                                          "music/Badshah_-Fly_Shehnaaz_Gill_Uchana_Amit_D_Soldierz__Official_Video_2021(128k).mp3";
                                      ByteData bytes = await rootBundle.load(
                                          audioasset); //load sound from assets
                                      Uint8List soundbytes = bytes.buffer
                                          .asUint8List(bytes.offsetInBytes,
                                              bytes.lengthInBytes);
                                      if (!isplaying && !audioplayed) {
                                        int result = await audioPlayer
                                            .playBytes(soundbytes);
                                        if (result == 1) {
                                          //play success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                          });
                                        } else {
                                          print("Error while playing audio.");
                                        }
                                      } else if (audioplayed && !isplaying) {
                                        int result = await audioPlayer.resume();
                                        if (result == 1) {
                                          //resume success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                            Icons.pause;
                                          });
                                        } else {
                                          print("Error on resume audio.");
                                        }
                                      } else {
                                        int result = await audioPlayer.pause();
                                        if (result == 1) {
                                          //pause success
                                          setState(() {
                                            isplaying = false;
                                          });
                                        } else {
                                          print("Error on pause audio.");
                                        }
                                      }
                                    },
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(
                                          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      '''i'm Good(Blue)''',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      'David Guetta & Bebe Rexha',
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        islike1
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            islike1 = !islike1;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  ListTile(
                                    onTap: () async {
                                      String audioasset =
                                          "music/Badshah_-Fly_Shehnaaz_Gill_Uchana_Amit_D_Soldierz__Official_Video_2021(128k).mp3";
                                      ByteData bytes = await rootBundle.load(
                                          audioasset); //load sound from assets
                                      Uint8List soundbytes = bytes.buffer
                                          .asUint8List(bytes.offsetInBytes,
                                              bytes.lengthInBytes);
                                      if (!isplaying && !audioplayed) {
                                        int result = await audioPlayer
                                            .playBytes(soundbytes);
                                        if (result == 1) {
                                          //play success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                          });
                                        } else {
                                          print("Error while playing audio.");
                                        }
                                      } else if (audioplayed && !isplaying) {
                                        int result = await audioPlayer.resume();
                                        if (result == 1) {
                                          //resume success
                                          setState(() {
                                            isplaying = true;
                                            audioplayed = true;
                                            Icons.pause;
                                          });
                                        } else {
                                          print("Error on resume audio.");
                                        }
                                      } else {
                                        int result = await audioPlayer.pause();
                                        if (result == 1) {
                                          //pause success
                                          setState(() {
                                            isplaying = false;
                                          });
                                        } else {
                                          print("Error on pause audio.");
                                        }
                                      }
                                    },
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(
                                          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: Text(
                                      '''i'm Good(Blue)''',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      'David Guetta & Bebe Rexha',
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                          islike2
                                              ? Icons.favorite_border
                                              : Icons.favorite,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(
                                          () {
                                            islike2 = !islike2;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 720),
              child: Container(
                height: 80,
                width: 365,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomLeft: const Radius.circular(20),
                      bottomRight: const Radius.circular(20)),
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    colors: [
                      Colors.white38.withOpacity(0.1),
                      Colors.white38.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => search()));
                          },
                          child: Icon(Icons.search, color: Colors.white)),
                      Icon(Icons.library_music_outlined, color: Colors.white),
                      Icon(Icons.person_outline_outlined, color: Colors.white)
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
