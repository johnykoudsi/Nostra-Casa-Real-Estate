import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';
import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/dialogs_widgets/dialogs_yes_no.dart';

class AttributesList extends StatefulWidget {
  AttributesList({
    Key? key,
    required this.propertyTypeAttributes,
  }) : super(key: key);
  final Map<String, int>? propertyTypeAttributes;

  @override
  State<AttributesList> createState() => _AttributesListState();

}

class _AttributesListState extends State<AttributesList> {
  static final GlobalKey<FormState> validationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController editAttributeName = TextEditingController();
    TextEditingController editAttributeNumber = TextEditingController();
    final addPropertyBloc = context.watch<AddPropertyBloc>();
    addPropertyBloc.state.propertyTypeAttributes =
        widget.propertyTypeAttributes;
    void plus(int index) {
      setState(() {
        if (widget.propertyTypeAttributes!.entries.toList()[index].value <
            999) {
          widget.propertyTypeAttributes!.update(
              widget.propertyTypeAttributes!.entries.toList()[index].key,
              (value) => value + 1);
          addPropertyBloc.state.propertyTypeAttributes =
              widget.propertyTypeAttributes;
        }
      });
    }

    void minus(int index) {
      setState(() {
        if (widget.propertyTypeAttributes!.entries.toList()[index].value > 0) {
          widget.propertyTypeAttributes!.update(
              widget.propertyTypeAttributes!.entries.toList()[index].key,
              (value) => value - 1);
          addPropertyBloc.state.propertyTypeAttributes =
              widget.propertyTypeAttributes;
        }
      });
    }
    editPropertyTypeAttribute() {
      setState(() {
if(validationKey.currentState!.validate()){
  widget.propertyTypeAttributes!.update(editAttributeName.text,
          (value) => int.parse(editAttributeNumber.text));
  Navigator.of(context).pop(false);
}

      });
    }

    Future<bool> showEditPropertyTypeAttributeDialog(int index) async {
      editAttributeName.text =
          widget.propertyTypeAttributes!.entries.toList()[index].key;
      editAttributeNumber.text = widget.propertyTypeAttributes!.entries
          .toList()[index]
          .value
          .toString();
      return DialogsWidgetsYesNo.textFieldDialog(
          key: validationKey,
          operationName: "Edit",
          context: context,
          attributeNameController: editAttributeName,
          attributeNumberController: editAttributeNumber,
          changePropertyAttribute: editPropertyTypeAttribute,
          enable: false);
    }

    double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: widget.propertyTypeAttributes?.entries.toList().length,
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

                            widget.propertyTypeAttributes!.entries
                                .toList()[index]
                                .key,
                            style: Theme.of(context).textTheme.headline5,
                            
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                widget.propertyTypeAttributes!.entries
                                    .toList()[index]
                                    .value
                                    .toString(),
                                style: Theme.of(context).textTheme.headline5,
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
        });
  }
}
