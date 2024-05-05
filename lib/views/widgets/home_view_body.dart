import 'package:e_book/core/utils/assets.dart';
import 'package:e_book/core/utils/styles.dart';
import 'package:e_book/views/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_list_view_item.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const [
         CustomAppBar(),
         FeaturedBooksListView(),
         SizedBox(
          height:50 ,
         ),
         Text('Best Seller',
         style: Styles.titleMedium,
         )
        ],
      ),
    );
  }
}

