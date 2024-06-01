import 'package:dartz/dartz.dart';
import 'package:e_book/core/errors/failures.dart';
import 'package:e_book/features/home/data/models/book_model/book_model.dart';
import 'package:e_book/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSelllerBooks() {
    // TODO: implement fetchBestSelllerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}