import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class ImagesList extends StatelessWidget {
  ImagesList({Key? key, this.images}) : super(key: key);
  List<File>? images;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images == null ? 0 : images!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.file(
                      images![index],
                      fit: BoxFit.contain,
                    ),
                  ),
          );
        });
  }
}
