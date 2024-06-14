import 'package:e_book/core/utils/styles.dart';
import 'package:e_book/core/utils/widgets/custom_button.dart';
import 'package:e_book/features/home/data/models/book_model/book_model.dart';
import 'package:e_book/views/widgets/book_rating.dart';
import 'package:e_book/views/widgets/books_action.dart';
import 'package:e_book/views/widgets/books_details_section.dart';
import 'package:e_book/views/widgets/custom_book_details_app_bar.dart';
import 'package:e_book/views/widgets/custom_book_image.dart';
import 'package:e_book/views/widgets/similar_books_list_view.dart';
import 'package:e_book/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children:  [
              const  CustomBookDetailsAppBar(),
                BookDetailsSection(
                  bookModel:bookModel ,
                ),
              const  Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
               const SimilarBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
