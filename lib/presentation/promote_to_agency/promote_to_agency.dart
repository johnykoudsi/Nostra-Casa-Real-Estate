import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nostra_casa/presentation/promote_to_agency/widgets/files_list.dart';
import 'package:nostra_casa/utility/app_routes.dart';

import '../../business_logic/promote_to_agency/promote_to_agency_bloc.dart';
import '../../utility/app_style.dart';
import '../add_property/widgets/custom_elevated_button.dart';
import '../global_widgets/custom_text_field.dart';

class PromoteToAgency extends StatefulWidget {
  const PromoteToAgency({Key? key}) : super(key: key);

  @override
  State<PromoteToAgency> createState() => _PromoteToAgencyState();
}

class _PromoteToAgencyState extends State<PromoteToAgency> {
  List<File>? files;

  final ImagePicker _picker = ImagePicker();

  Future<void> _chooseFiles() async {
    final pickedFiles = await _picker.pickMultiImage();
    setState(() {
      if (files != null) {
        files?.addAll(
            pickedFiles.map((pickedFile) => File(pickedFile.path)).toList());
      } else {
        files = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      }
    });
  }
  void _removeFile(File image) {
    setState(() {
      files!.remove(image);
    });
  }
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController promotionRequestController = TextEditingController();
@override
void dispose() {
  context.read<PromoteToAgencyBloc>().close();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.blackColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppStyle.kBackGroundColor,
          ),
        ),
        title: Text(
          "Promote To Agency".tr(),
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: AppStyle.kBackGroundColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenWidth * 0.038,
            bottom: screenWidth * 0.038),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              CustomTextField(
                hintText: "reason for promotion request".tr(),
                passwordBool: false,
                label: "Application Request".tr(),
                controller: promotionRequestController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name can not be empty".tr();
                  }
                  return null;
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              CustomElevatedButton(
                  backgroundColor: Colors.white,
                  onPress: _chooseFiles,
                  title: "Add your agency files",
                  iconData: Icons.add),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Visibility(
                visible: files == null
                    ? false
                    : files!.isEmpty
                        ? false
                        : true,
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.3,
                  child: FilesList(
                    files: files,
                    onImageRemoved: _removeFile,
                  ),
                ),
              ),
              CustomElevatedButton(
                  backgroundColor: Colors.white,
                  onPress: () {
                    Navigator.pushNamed(context, AppRoutes.addAgencyLocation);
                  },
                  title: "Add your agency location",
                  iconData: Icons.map_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
