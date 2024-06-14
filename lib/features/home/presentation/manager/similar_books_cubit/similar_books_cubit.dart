import 'package:e_book/features/home/data/repos/home_repo.dart';
import 'package:e_book/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category})async
  {
    emit(SimilarBooksLoading());
   var result =await homeRepo.fetchSimilarBooks(category: category);

   result.fold((Failure)
   {
    emit(SimilarBooksFailure(Failure.errMessage));
   }, (books)
   {
    emit(SimilarBooksSuccess(books));
   }); 
  }
}
