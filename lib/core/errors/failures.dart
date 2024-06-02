// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

abstract class Failure{

  final String errMessage;

 const  Failure(this.errMessage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errMessage);



    factory ServerFailure.fromDiorError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('badCertificate with api server');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioErrorType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioErrorType.unknown:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode , dynamic response )
  {
    if(statusCode == 400 ||statusCode == 401 || statusCode == 403 )
    {
      return ServerFailure(response['error']['message']);
    }else if (statusCode == 404)
    {
      return ServerFailure('Your request not found, Please try later');
    }else if (statusCode == 500)
    {
      return ServerFailure('Internal Server error , Please try later');
    }else 
    {
      return ServerFailure('Opps There was an Eror, Please try again');
    };
  }
}