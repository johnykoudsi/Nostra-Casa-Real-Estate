import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final String label;

  CustomDatePicker({required this.onDateSelected,required this.label});

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            widget.label,
            style:Theme.of(context).textTheme.bodyText1!.copyWith(
              color: AppStyle.blackColor,
            )
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: screenHeight*0.057,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppStyle.k4RadiusLowerPadding,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
            child: Row(
                    children: [
                      Text('${_selectedDate.day}',style:Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppStyle.kGreyColor,
                      ),),
                      SizedBox(width: 8.0),
                      Text('${_selectedDate.month}',style:Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppStyle.kGreyColor,
                      ),),
                      SizedBox(width: 8.0),
                      Text('${_selectedDate.year}',style:Theme.of(context).textTheme.headline5!.copyWith(
                        color: AppStyle.kGreyColor,
                      ),),
                    ],
            ),
          ),
        ),
        //   GestureDetector(
        //   onTap: _showDatePicker,
        //   child: Container(
        //     padding: EdgeInsets.all(16.0),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8.0),
        //       border: Border.all(color: Colors.grey),
        //     ),
        //     child: Row(
        //       children: [
        //         Text('${_selectedDate.day}'),
        //         SizedBox(width: 8.0),
        //         Text('${_selectedDate.month}'),
        //         SizedBox(width: 8.0),
        //         Text('${_selectedDate.year}'),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );


  }

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      widget.onDateSelected(_selectedDate);
    }
  }
}