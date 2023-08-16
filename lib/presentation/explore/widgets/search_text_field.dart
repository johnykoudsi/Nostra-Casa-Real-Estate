import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    required this.onClear,
    required this.onSend,
    required this.searchController,
    required this.showSearchDeleteIcon,
    Key? key}) : super(key: key);
  Function()? onClear;
  Function(String?) onSend;
  TextEditingController searchController;
  bool showSearchDeleteIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search".tr(),
            style: Theme.of(context)
                .textTheme
                .headline4,
          ),
          const SizedBox(height: 8,),
          TextFormField(
            controller: searchController,
            onFieldSubmitted: onSend,
            style: const TextStyle(
                color: AppStyle.mainColor
            ),
            keyboardType: TextInputType.name,
            cursorColor: AppStyle.mainColor,
            decoration: InputDecoration(
              hintText: 'Search'.tr(),
              // hintStyle: TextStyle(
              //     color: kGreyColor,
              //     fontFamily: kNormalFont,
              //     fontSize: 4 * SizeConfig.blockSizeHorizontal),
              contentPadding:
              const EdgeInsets.only(
                  left: 15,
                  bottom: 0,
                  top: 0,
                  right: 15),
              suffixIcon: showSearchDeleteIcon
                  ? GestureDetector(
                onTap:onClear,
                child: const Icon(
                  Icons.cancel_rounded,
                  color: AppStyle.redColor,
                ),
              )
                  : GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus
                      ?.unfocus();
                  onSend(searchController.text);
                },
                child: const Icon(
                  Icons.search,
                  color:
                  AppStyle.kGreyColor,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  )),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppStyle.mainColor,
                  )),
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: AppStyle.mainColor,
                  )),
            ),
          ),

        ],
      ),
    );
  }
}
