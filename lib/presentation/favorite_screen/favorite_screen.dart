import 'package:flutter/material.dart';

import '../../business_logic/get_properties/get_all-properties_search_filter.dart';
import '../all_product_with_filter_screen/all_product_with_filter_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AllProductsWithFilterScreen(
        propertiesSearchFilter: GetAllPropertiesSearchFilter(
          myFavorite: true
        ),
    );
  }
}
