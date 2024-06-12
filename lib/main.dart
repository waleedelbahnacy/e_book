import 'package:dio/dio.dart';
import 'package:e_book/constants.dart';
import 'package:e_book/core/utils/api_service.dart';
import 'package:e_book/core/utils/app_router.dart';
import 'package:e_book/core/utils/service_locator.dart';
import 'package:e_book/features/home/data/repos/home_repo_impl.dart';
import 'package:e_book/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:e_book/features/home/presentation/manager/newset_books_cubit/newest_books_cubit.dart';
import 'package:e_book/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart'; 
import 'package:google_fonts/google_fonts.dart';

void main(){
  setupServiceLocator(); 
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context)=> FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
         )..fetchFeaturedBooks(),
          ),
              BlocProvider(create:(context)=> NewestBooksCubit(
               getIt.get<HomeRepoImpl>(),
            )..fetchNewestBooks(),
             )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:KPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
       
      ),
    );
  }
}




   