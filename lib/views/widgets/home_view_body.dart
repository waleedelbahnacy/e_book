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
         ),
         BestSellerListViewItem(),
        ],
      ),
    );
  }
}


class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem ({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
        aspectRatio: 2.5/4,
        child: Container( 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
            image:const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsData.testImage,
                ),
                ),
          ),
        ),
      ),
        ],
      ),
    );
  }
}
