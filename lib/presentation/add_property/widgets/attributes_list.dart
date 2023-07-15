import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';
import '../../../utility/app_style.dart';

class AttributesList extends StatefulWidget {
  const AttributesList({
    Key? key,
    required this.defaultNumbers,
    required this.attributesNames,
  }) : super(key: key);
  final List<int> defaultNumbers;
  final List<String> attributesNames;

  @override
  State<AttributesList> createState() => _AttributesListState();
}

class _AttributesListState extends State<AttributesList> {
  @override
  Widget build(BuildContext context) {
    void plus(int index) {
      setState(() {
        if(widget.defaultNumbers[index]<999){
          widget.defaultNumbers[index]++;

        }
      });
    }

    void minus(int index) {
      setState(() {
        if(widget.defaultNumbers[index]>0){
          widget.defaultNumbers[index]--;


        }
      });
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: const BoxDecoration(
                color: AppStyle.kBackGroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.attributesNames[index],
                        style: Theme.of(context).textTheme.headline5,
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
                              widget.defaultNumbers[index].toString(),
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
              ));
        });
  }
}
