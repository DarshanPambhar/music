import 'package:flutter/material.dart';

import 'main.dart';
import 'widget.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF352440),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Music()));
                          },
                          child: const Icon(
                            Icons.chevron_left_outlined,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white38,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                  child: Text(
                    'Recent favourites',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    song().ganaplay(
                      images:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAofpN3qhKubdljBnZb9rlu-W8kp5oYZXY2Q&usqp=CAU',
                      title1: 'Bright Hits',
                      title2: '''The most Popular 
and striking music news''',
                    ),
                    song().ganaplay(
                      images:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLd1O6h6pxkYh-3bNdM9XaSPimvph3997JQw&usqp=CAU',
                      title1: 'Millions',
                      title2: 'Alwayes never',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    song().ganaplay(
                      images:
                          'https://w0.peakpx.com/wallpaper/730/762/HD-wallpaper-music-note-green-background-music.jpg',
                      title1: 'Millions',
                      title2: 'Alwayes never',
                    ),
                    song().ganaplay(
                      images:
                          'https://t4.ftcdn.net/jpg/05/65/28/71/360_F_565287194_rjQSLfRgjB68mwVyin6FTUqBJhv3US9o.jpg',
                      title1: 'Family Tourism',
                      title2: 'Alwayes never',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    song().ganaplay(
                      images:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbHQFVCSFFs56jFvLyMwfCPRgjKJvDrU0rig&usqp=CAU',
                      title1: 'Bright Hits',
                      title2: 'The most Popular ',
                    ),
                    song().ganaplay(
                      images:
                          'https://media.istockphoto.com/id/501597460/photo/yamaha-vertical-piano-ebony-and-ivory-keys.jpg?s=612x612&w=0&k=20&c=Va2-6KN7mxRRqwxk7nEloooF6MSWIz3km8cXxjVW2C4=',
                      title1: 'Millions',
                      title2: 'Alwayes never',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
