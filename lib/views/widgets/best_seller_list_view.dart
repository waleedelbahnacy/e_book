import 'package:e_book/core/utils/widgets/custom_loading_indicator.dart';
import 'package:e_book/features/home/presentation/manager/newset_books_cubit/newest_books_cubit.dart';
import 'package:e_book/features/home/presentation/manager/newset_books_cubit/newset_books_state.dart';
import 'package:e_book/views/widgets/best_seller_list_view_item.dart';
import 'package:e_book/views/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(
      builder: (BuildContext context, state) { 
      if (state is NewestBooksSuccess) {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: state.books.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            bookModel: state.books[index],
          ),
        );
      },
      );
}else if (state is NewestBooksFailure)
{
  return CustomErrorWidget(errMessage: state.errMessage);
}else
{
  return const CustomLoadingIndicator();
}
  },
  );
  
  }
}
