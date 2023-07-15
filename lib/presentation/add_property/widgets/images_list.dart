import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';

class ImagesList extends StatefulWidget {
  ImagesList({Key? key, this.images, required this.onImageRemoved})
      : super(key: key);
  List<File>? images;
  final Function(File) onImageRemoved;

  @override
  State<ImagesList> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.images == null ? 0 : widget.images!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.file(
                    widget.images![index],
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                    top: 5,
                    left: 5,
                    child: RoundedElevatedButton(
                      onTap: () {
                        setState(() {
                          widget.onImageRemoved(widget.images![index]);
                        });
                      },
                      iconData: Icons.delete_forever,
                      iconColor: Colors.red,
                      backgroundColor: Colors.black,
                    )),
              ],
            ),
          );
        });
  }
}
