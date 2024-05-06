import 'package:e_book/constants.dart';
import 'package:e_book/core/utils/styles.dart';
import 'package:e_book/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/assets.dart';

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
            image:const  DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsData.testImage,
                ),
                ),
          ),
        ),
      ),
      const SizedBox(
        width: 30,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                'Harry Potter and the Globet of Fire',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              style: Styles.textStyle20.copyWith(
                fontFamily: KGtSectraFine,
              ),
              ),
            ),
           const  SizedBox(
              height: 3,
            ),
            const Text('J.K. Rowling',
            style: Styles.textStyle14,
            ),
             const  SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text('19.99 €',
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                ),
               const Spacer(),
               const BookRating(),
              ],
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}

