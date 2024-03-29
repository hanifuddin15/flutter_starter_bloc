import 'package:dartz/dartz.dart';

import '../../../../../data/network/api_failure.dart';
import '../models/login_response.dart';

abstract class LoginRepositoryImp {
  Future<Either<ApiFailure, LoginResponse>> loginUser(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> getSocialLogin(
      Map<String, dynamic> params, String type);

  Future<Either<ApiFailure, dynamic>> getOtpVerificationCode(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> getVerifyOtp(Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> fetchCountryData();
  Future<Either<ApiFailure, LoginResponse>> getMobileLogin(
      Map<String, dynamic> params);
}
