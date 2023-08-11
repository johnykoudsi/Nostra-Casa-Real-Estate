import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';
import 'package:nostra_casa/utility/app_style.dart';


class FilesList extends StatefulWidget {
  FilesList({Key? key, this.files, required this.onImageRemoved})
      : super(key: key);
  List<File>? files;
  final Function(File) onImageRemoved;

  @override
  State<FilesList> createState() => _FilesListState();
}

class _FilesListState extends State<FilesList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 1,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.files == null ? 0 : widget.files!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:  EdgeInsets.only(left: screenWidth*0.038,right: screenWidth*0.038,top: screenHeight*0.01,bottom: screenHeight*0.01),
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth*0.7,
                      height: screenHeight*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: AppStyle.blackColor,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: Image.file(
                          widget.files![index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: RoundedElevatedButton(
                          onTap: () {
                            setState(() {
                              widget.onImageRemoved(widget.files![index]);
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
