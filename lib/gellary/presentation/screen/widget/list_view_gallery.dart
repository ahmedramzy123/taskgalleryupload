import 'package:flutter/material.dart';

class ListViewGallery extends StatelessWidget {
  String image;


  ListViewGallery(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 21, bottom: 38, right: 24),
      child: Container(
        width: 108,
        height: 108,
        decoration: BoxDecoration(
            image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    image)),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
