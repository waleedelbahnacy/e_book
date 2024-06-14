import 'package:e_book/core/utils/service_locator.dart';
import 'package:e_book/features/home/data/models/book_model/book_model.dart';
import 'package:e_book/features/home/data/repos/home_repo_impl.dart';
import 'package:e_book/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:e_book/features/search/presentation/views/search_view.dart';
import 'package:e_book/views/book_details_view.dart';
import 'package:e_book/views/home_view.dart';
import 'package:e_book/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KBookDetailsView = '/bookDetailsView';
  static const KSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: KHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KBookDetailsView,
        builder: (context, state) => BlocProvider(
          create:(context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>(),) ,
          child:  BookDetailsView(
            bookModel:state.extra as BookModel ,
          )),
      ),
      GoRoute(
        path: KSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
