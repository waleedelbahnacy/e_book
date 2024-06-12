import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
  'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');

  List<BookModel> books = [];
  for (var item in data['items']) {
    try {
  books.add(BookModel.fromJson(item));
}  catch (e) {
  books.add(BookModel.fromJson(item));
}
  }

  return right(books);
} catch (e) {
  if (e is DioError) {
    return left(
      ServerFailure.fromDiorError(e));
  }

  return left(ServerFailure(e.toString(),
  ),
  );
}
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
       try {
  var data = await apiService.get(
     endpoint:
  'volumes?Filtering=free-ebooks&q=subject:programming');

  List<BookModel> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }

  return right(books);
} catch (e) {
  // ignore: deprecated_member_use
  if (e is DioError) {
    return left(
      ServerFailure.fromDiorError(e));
  }

  return left(ServerFailure(e.toString(),
  ),
  );
}
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
    {required String category})async {  
    Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
       try {
  var data = await apiService.get(
     endpoint:
  'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:programming');

  List<BookModel> books = [];
  for (var item in data['items']) {
    books.add(BookModel.fromJson(item));
  }

  return right(books);
} catch (e) {
  // ignore: deprecated_member_use
  if (e is DioError) {
    return left(
      ServerFailure.fromDiorError(e));
  }

  return left(ServerFailure(e.toString(),
  ),
  );
}
  }
}}
