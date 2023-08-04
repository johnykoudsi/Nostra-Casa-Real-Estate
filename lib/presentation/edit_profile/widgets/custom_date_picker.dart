import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final String label;
 // DateTime selectedDate;
  Function(DateTime value)? onChange;

  CustomDatePicker({
    required this.onDateSelected,
    required this.label,
   // required this.selectedDate,
    this.onChange,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
   DateTime _selectedDate = DateTime.now();
  bool datePicked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppStyle.blackColor,
                )),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: screenHeight * 0.057,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: AppStyle.k4RadiusLowerPadding,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 15),
            child: Row(
              children: [
                GestureDetector(
                    onTap: _showDatePicker,
                    child: const Icon(
                      Icons.calendar_month,
                      color: AppStyle.kGreyColor,
                    )),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Text(
                  "${_selectedDate.day} /",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color:datePicked ? Colors.black : AppStyle.kGreyColor,
                      ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  "${_selectedDate.month} /",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: datePicked ? Colors.black : AppStyle.kGreyColor,
                      ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '${_selectedDate.year}',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: datePicked ? Colors.black : AppStyle.kGreyColor,
                      ),
                ),
              ],
            ),
          ),
        ),
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
        datePicked = true;
        widget.onChange;


      });
      widget.onDateSelected(_selectedDate);
    }
  }
}
