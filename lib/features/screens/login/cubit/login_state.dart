// part of 'login_cubit.dart';
//
// enum LoginStatus {
//   empty,
//   filled,
//   initial,
//   loading,
//   success,
//   failure,
//   authFail,
//   notFound,
// }
//
// enum MobileNumberStatus { initial, invalid, valid }
//
// enum ErrorStatus { initial, emailError, passwordError, emailValidationError }
//
// class LoginState extends Equatable {
//   final LoginStatus status;
//   final ErrorStatus errorStatus;
//   final bool nextEnableForMobileNumber;
//   final String otpCode;
//   final String validationMessage;
//   final int timer;
//   final OtpStatus otpStatus;
//   final MobileNumberStatus mobileNumberStatus;
//   final CountryModel? selectedCountryModel;
//   final bool dropDownIconChangeFlag;
//   const LoginState(
//       {this.status = LoginStatus.empty,
//       this.errorStatus = ErrorStatus.initial,
//       this.nextEnableForMobileNumber = false,
//       this.otpCode = "",
//       this.validationMessage = AppStrings.sendCodeToPhoneMessage,
//       this.timer = 0,
//       this.otpStatus = OtpStatus.initial,
//       this.selectedCountryModel,
//       this.mobileNumberStatus = MobileNumberStatus.initial,
//       this.dropDownIconChangeFlag = false});
//
//   LoginState copyWith(
//       {final LoginStatus? status,
//       final ErrorStatus? errorStatus,
//       final bool? nextEnableForMobileNumber,
//       final String? otpCode,
//       final String? validationMessage,
//       final int? timer,
//       OtpStatus? otpStatus,
//       CountryModel? selectedCountryModel,
//       MobileNumberStatus? mobileNumberStatus,
//       final bool? dropDownIconChangeFlag}) {
//     return LoginState(
//         status: status ?? this.status,
//         errorStatus: errorStatus ?? this.errorStatus,
//         nextEnableForMobileNumber:
//             nextEnableForMobileNumber ?? this.nextEnableForMobileNumber,
//         otpCode: otpCode ?? this.otpCode,
//         validationMessage: validationMessage ?? this.validationMessage,
//         timer: timer ?? this.timer,
//         otpStatus: otpStatus ?? this.otpStatus,
//         selectedCountryModel: selectedCountryModel ?? this.selectedCountryModel,
//         mobileNumberStatus: mobileNumberStatus ?? this.mobileNumberStatus,
//         dropDownIconChangeFlag:
//             dropDownIconChangeFlag ?? this.dropDownIconChangeFlag);
//   }
//
//   @override
//   List<Object> get props => [
//         status,
//         errorStatus,
//         nextEnableForMobileNumber,
//         otpCode,
//         validationMessage,
//         timer,
//         otpStatus,
//         selectedCountryModel ?? {},
//         mobileNumberStatus,
//         dropDownIconChangeFlag
//       ];
// }
