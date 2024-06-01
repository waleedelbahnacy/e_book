import 'package:dartz/dartz.dart';
import 'package:e_book/core/errors/failures.dart';
import 'package:e_book/core/utils/api_service.dart';
import 'package:e_book/features/home/data/models/book_model/book_model.dart';
import 'package:e_book/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks()async {
    try {
  var data = await apiService.get(
     endpoint:
  'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:programming');

  List<BookModel> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }

  return right(books);
} catch (e) {
  return left(ServerFailure());
}
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}