// import 'dart:developer';
//
// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../../../core/app/app_dependency.dart';
// import '../../../../../core/app/app_logger.dart';
// import '../../../../../data/network/api_client.dart';
// import '../../../../../data/network/api_exception.dart';
// import '../../../../../data/network/api_failure.dart';
// import '../../../../../data/network/api_urls.dart';
// import '../models/login_response.dart';
// import 'login_repo_imp.dart';
//
// @Injectable(as: LoginRepositoryImp)
// class LoginRepository implements LoginRepositoryImp {
//   final ApiClient apiClient;
//   final AppLogger _appLogger;
//
//   LoginRepository({required this.apiClient}) : _appLogger = instance.get();
//
//   @override
//   Future<Either<ApiFailure, LoginResponse>> loginUser(
//       Map<String, dynamic> params) async {
//     try {
//       final response = await apiClient.request(
//           url: ApiUrls.login, method: Method.post, params: params);
//
//       return Right(LoginResponse.fromJson(response));
//     } catch (error, stackTrace) {
//       log('$stackTrace');
//       return Left(ApiException.handle(error).failure);
//     }
//   }
//
//   @override
//   Future<Either<ApiFailure, dynamic>> getSocialLogin(
//       Map<String, dynamic> params, String type) async {
//     try {
//       final response = await apiClient.request(
//           url: "auth/$type/login", method: Method.post, params: params);
//
//       return Right(LoginResponse.fromJson(response));
//     } catch (error, stackTrace) {
//       log('$stackTrace');
//       return Left(ApiException.handle(error).failure);
//     }
//   }
//
//   @override
//   Future<Either<ApiFailure, dynamic>> getOtpVerificationCode(
//       Map<String, dynamic> params) async {
//     try {
//       final response = await apiClient.request(
//           url: ApiUrls.sendLoginOtp, method: Method.post, params: params);
//
//       return Right(response);
//     } catch (error, stackTrace) {
//       log('===========login repo$stackTrace');
//       // _appLogger.sendLogMessage(ApiException.handle(error).failure.message);
//       return Left(ApiException.handle(error).failure);
//     }
//   }
//
//   @override
//   Future<Either<ApiFailure, dynamic>> getVerifyOtp(
//       Map<String, dynamic> params) async {
//     try {
//       final response = await apiClient.request(
//           url: ApiUrls.verifyOtp, method: Method.post, params: params);
//
//       return Right(response);
//     } catch (error, stackTrace) {
//       log('$stackTrace');
//       return Left(ApiException.handle(error).failure);
//     }
//   }
//
//   @override
//   Future<Either<ApiFailure, dynamic>> fetchCountryData() async {
//     try {
//       ApiUrls.baseUrl = "https://restcountries.com/v3.1/all";
//       final response =
//           await apiClient.request(url: ApiUrls.baseUrl, method: Method.get);
//       return Right(response);
//     } catch (error, stackTrace) {
//       return Left(ApiException.handle(error).failure);
//     }
//   }
//
//   @override
//   Future<Either<ApiFailure, LoginResponse>> getMobileLogin(
//       Map<String, dynamic> params) async {
//     try {
//       final response = await apiClient.request(
//           url: ApiUrls.mobileLogin, method: Method.post, params: params);
//
//       return Right(LoginResponse.fromJson(response));
//     } catch (error, stackTrace) {
//       log('$stackTrace');
//       return Left(ApiException.handle(error).failure);
//     }
//   }
// }
