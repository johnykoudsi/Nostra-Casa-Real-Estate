import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class ImagesList extends StatelessWidget {
  ImagesList({Key? key, this.images}) : super(key: key);
  List<File>? images;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
        itemCount: images == null ? 0 : images!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppStyle.blackColor,
                    width: 3,
                  ),
                ),
                child: images == null
                    ? const Text('No image taken.')
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.file(
                          images![index],
                          fit: BoxFit.contain,
                        ),
                      )),
          );
        });
  }
}
