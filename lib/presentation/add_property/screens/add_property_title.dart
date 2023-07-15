// import 'package:flutter/material.dart';
//
// import '../../../utility/app_style.dart';
//
// class AddPropertyTitle extends StatefulWidget {
//   const AddPropertyTitle({Key? key}) : super(key: key);
//
//   @override
//   State<AddPropertyTitle> createState() => _AddPropertyTileState();
// }
//
// class _AddPropertyTileState extends State<AddPropertyTitle> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: AppStyle.kBackGroundColor,
//       body: Padding(
//         padding: EdgeInsets.only(
//             left: screenWidth * 0.07,
//             right: screenWidth * 0.07,
//             top: screenHeight * 0.03),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               'Where\'s your place locates?',
//               style: Theme.of(context).textTheme.headline2,
//             ),
//             Text(
//               'Your address is only shared with clients after they\'ve made an account',
//               style: Theme.of(context).textTheme.headline6!.copyWith(color: AppStyle.kGreyColor),
//             ),
//             SizedBox(
//               height: screenHeight * 0.03,
//             ),
//             Expanded(
//               child: MapScreen(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
