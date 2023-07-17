import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nostra_casa/presentation/add_property/widgets/custom_elevated_button.dart';
import 'package:nostra_casa/presentation/add_property/widgets/images_list.dart';

import '../../../utility/app_style.dart';

class ImagesCount {
  static int counter = 0;
}

class AddPropertyImages extends StatefulWidget {
  const AddPropertyImages({Key? key}) : super(key: key);

  @override
  State<AddPropertyImages> createState() => _AddPropertyImagesState();
}

class _AddPropertyImagesState extends State<AddPropertyImages> {
  List<File>? images;
  File? _cameraImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _chooseImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      images?.addAll(
          pickedFiles.map((pickedFile) => File(pickedFile.path)).toList());
      if (images != null) {
        ImagesCount.counter = images!.length;
      }
    });
  }

  Future<void> _takeImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _cameraImage = pickedFile != null ? File(pickedFile.path) : null;
      if (pickedFile != null) {
        final cameraImage = File(pickedFile.path);
        if (images == null) {
          images = [cameraImage];
        } else {
          images!.add(cameraImage);
        }
        if (images != null) {
          ImagesCount.counter = images!.length;
        }
      }
    });
  }

  void _removeImage(File image) {
    images!.remove(image);
    if (images != null) {
      ImagesCount.counter = images!.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Add some photos of your house',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'You\'ll need 3 photos to get started. you can add more or make changed later.',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppStyle.kGreyColor),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: Column(
                children: [
                  CustomElevatedButton(
                      onPress: _chooseImages,
                      title: "Add photos",
                      iconData: Icons.add),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  CustomElevatedButton(
                      onPress: _takeImage,
                      title: "Take new photos",
                      iconData: Icons.camera_alt_outlined),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Expanded(
                    child: ImagesList(
                      images: images,
                      onImageRemoved: _removeImage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
