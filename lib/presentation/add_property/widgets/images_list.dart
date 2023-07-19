import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<AddPropertyBloc, AddPropertyState>(
  builder: (context, state) {
    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1,
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
    ),
        scrollDirection: Axis.horizontal,
        itemCount: state.images == null ? 0 : state.images!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.038,right: screenWidth*0.038,top: screenHeight*0.01,bottom: screenHeight*0.01),
            child: Stack(
              children: [
                Container(
                  width: screenWidth*0.7,
                  height: screenHeight*0.15,
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
                      state.images![index],
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
                          widget.onImageRemoved(state.images![index]);
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
  },
);
  }
}
