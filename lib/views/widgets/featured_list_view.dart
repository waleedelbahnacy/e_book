import 'package:e_book/core/utils/widgets/custom_loading_indicator.dart';
import 'package:e_book/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:e_book/features/home/presentation/manager/featured_books_cubit/featured_books_states.dart';
import 'package:e_book/views/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
      builder: (BuildContext context, state) { 
              if (state is FeaturedBooksSuccess) {
  return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: CustomBookImage(),
  );
              }),
        );
}else if(state is FeaturedBooksFailure)
{
  return CustomErrorWidget(errMessage: state.errMessage);
}else{
  return const CustomLoadingIndicator();
}
      },
    );
  }
       }

