import 'package:flutter/material.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';
import '../../add_property/widgets/rounded_elevated_button.dart';

class MyPropertiesList extends StatefulWidget {
  const MyPropertiesList({Key? key}) : super(key: key);

  @override
  State<MyPropertiesList> createState() => _MyPropertiesListState();
}

class _MyPropertiesListState extends State<MyPropertiesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return MyPropertyItemWidget(
            index: index,
          );
        });
  }
}

class MyPropertyItemWidget extends StatelessWidget {
  MyPropertyItemWidget({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color:
            (index % 2 == 1) ? AppStyle.kBackGroundColor : AppStyle.kLightGrey,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.02,
            bottom: screenHeight * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: screenWidth * 0.35,
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FadeInImage(
                  placeholder: const AssetImage(AppAssets.greyLogo),
                  image: NetworkImage(
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Festate&psig=AOvVaw0LCBEEN6kDNirlzHCgeVa9&ust=1692392916016000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCJD5rYnN5IADFQAAAAAdAAAAABAK"),
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(width: 1, color: AppStyle.kGreyColor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          AppAssets.greyLogo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                )),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Damascus,Syria",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text("this is a title",
                    style: Theme.of(context).textTheme.headline5),
                Text(
                  "90000000",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundedElevatedButton(
                  onTap: () {
                  },
                  iconData: Icons.delete_forever,
                  iconColor: Colors.red,
                  backgroundColor: AppStyle.kBackGroundColor,
                ),
                RoundedElevatedButton(
                  onTap: () {
                  },
                  iconData: Icons.edit,
                  iconColor: Colors.black45,
                  backgroundColor: AppStyle.kBackGroundColor,
                ),
                RoundedElevatedButton(
                  onTap: () {
                  },
                  iconData: Icons.sync_alt_sharp,
                  iconColor: Colors.black45,
                  backgroundColor: AppStyle.kBackGroundColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
