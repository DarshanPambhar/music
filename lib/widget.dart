import 'package:flutter/material.dart';

class song {
  Widget ganaplay({
    required String images,
    required String title1,
    required String title2,
  }) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 3),
          child: Container(
            height: 210,
            width: 160,
            // color: Col ors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                Text(title1,
                    style: const TextStyle(
                        color: Colors.white60, fontWeight: FontWeight.w600)),
                Text(
                  title2,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(images), fit: BoxFit.cover)),
          ),
        )
      ],
    );
  }
}
