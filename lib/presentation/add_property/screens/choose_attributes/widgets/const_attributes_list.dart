import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';
import '../../../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../../../utility/app_style.dart';
import '../../../../global_widgets/dialogs_widgets/dialogs_yes_no.dart';

class ConstAttributesList extends StatefulWidget {
  ConstAttributesList({
    Key? key,
    this.attributesNames,
    this.attributesValues,
    required this.enableDelete,

  }) : super(key: key);
  final List<String>? attributesNames;
  final List<int>? attributesValues;
  bool enableDelete;

  @override
  State<ConstAttributesList> createState() => _ConstAttributesListState();
}

class _ConstAttributesListState extends State<ConstAttributesList> {
  static final GlobalKey<FormState> validationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController editAttributeName = TextEditingController();
    TextEditingController editAttributeNumber = TextEditingController();
    final addPropertyBloc = context.watch<AddPropertyBloc>();

    void plus(int index) {
      setState(() {
        if (widget.attributesValues![index] <
            999) {
          widget.attributesValues![index]++;

            addPropertyBloc.state.propertyTypeConstAttributes =
                widget.attributesValues;

        }
      });
    }
    void minus(int index) {
      setState(() {
        if (widget.attributesValues![index] >
            0) {
          widget.attributesValues![index]--;

          addPropertyBloc.state.propertyTypeConstAttributes =
              widget.attributesValues;

        }
      });
    }

    editPropertyTypeAttribute(int index) {
      setState(() {
        if (validationKey.currentState!.validate()) {
          widget.attributesValues![index]= int.parse(editAttributeNumber.text);

            addPropertyBloc.state.propertyTypeConstAttributes =
                widget.attributesValues;

          Navigator.of(context).pop();
        }
      });
    }
    Future<bool> showEditPropertyTypeAttributeDialog(int index) async {
      editAttributeNumber.text = widget.attributesValues![index].toString();
      return DialogsWidgetsYesNo.textFieldDialog(
          key: validationKey,
          operationName: "Edit",
          context: context,
          attributeNameController: editAttributeName,
          attributeNumberController: editAttributeNumber,
          changePropertyAttribute: editPropertyTypeAttribute,
          enable: false);
    }

    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: widget.attributesNames!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: () {
                    showEditPropertyTypeAttributeDialog(index);
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                        color: AppStyle.kBackGroundColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.attributesNames![index],
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  RoundedElevatedButton(
                                    iconData: Icons.remove,
                                    onTap: () {
                                      minus(index);
                                    },
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.09,
                                    child: Text(
                                      widget.attributesValues![index].toString(),

                                      style:
                                      Theme
                                          .of(context)
                                          .textTheme
                                          .headline5,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  RoundedElevatedButton(
                                    iconData: Icons.add,
                                    onTap: () {
                                      plus(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            color: AppStyle.kGreyColor,
                          ),
                        ],
                      )),
                );
              }),
        ),
      ],
    );
  }
}
