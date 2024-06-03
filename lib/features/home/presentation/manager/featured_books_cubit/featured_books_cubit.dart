

import 'package:e_book/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit( this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async
  {
    emit(FeaturedBooksLoading());
   var result =await homeRepo.fetchFeaturedBooks();

   result.fold((Failure)
   {
    emit(FeaturedBooksFailure(Failure.errMessage));
   }, (books)
   {
    emit(FeaturedBooksSuccess(books));
   }); 
  }
}