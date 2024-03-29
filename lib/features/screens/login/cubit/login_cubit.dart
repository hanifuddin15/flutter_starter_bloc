// import 'dart:async';
// import 'dart:developer';
// import 'package:equatable/equatable.dart';
// import 'package:fcm_config/fcm_config.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:injectable/injectable.dart';
// import 'package:shine/core/app/app_context.dart';
// import 'package:shine/features/screens/auth/login/view/otp_screen/otp_screen.dart';
// import 'package:shine/features/screens/dashboard/view/dashboard_screen.dart';
// import 'package:shine/features/screens/onboarding/view/general_info/general_info_main.dart';
//
// import '../../../../../core/app/app_dependency.dart';
// import '../../../../../core/app/app_preference.dart';
// import '../../../../../core/constants/app_strings.dart';
// import '../../../../../core/constants/strings.dart';
// import '../../../../components/custom_progress_loader.dart';
// import '../../../../router/routes.dart';
// import '../../../onboarding/models/country_model.dart';
// import '../../create_account/cubit/create_account_cubit.dart';
// import '../../success/signin_success_page.dart';
// import '../repository/login_repo_imp.dart';
//
// part 'login_state.dart';
//
// @injectable
// class LoginCubit extends Cubit<LoginState> {
//   final AppPreferences _appPreferences;
//   final LoginRepositoryImp _loginRepository;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passController = TextEditingController();
//   final TextEditingController changePasswordController =
//       TextEditingController();
//   final TextEditingController mobileNumberController = TextEditingController();
//
//   final TextEditingController otpController = TextEditingController();
//
//   final FocusNode focusNodePass = FocusNode();
//
//   //String otpValue ="";
//   LoginCubit(this._loginRepository)
//       : _appPreferences = instance.get(),
//         super(const LoginState());
//
//   CountryModel selectedCountryModel = CountryModel(
//       name: 'Bangladesh',
//       flag: "https://flagcdn.com/w320/bd.png",
//       code: "BD",
//       dialCode: "+880");
//
//   static List<String> scopes = <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ];
//
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     // Optional clientId
//     // clientId: '718814730493-l9j601iaklk8jc2bpv8hfdkb74bauvg6.apps.googleusercontent.com',
//     scopes: scopes,
//   );
//
//   // Initial time in seconds
//   Timer? timer;
//
//   getCountryCode(CountryModel country) {
//     selectedCountryModel = country;
//     emit(state.copyWith(selectedCountryModel: selectedCountryModel));
//     getValidatePhone();
//   }
//
//   // void getMobileNumber(value) {
//   //   emit(state.copyWith(
//   //       nextEnableForMobileNumber: mobileNumberController.text.isNotEmpty));
//   // }
//
//   void getValidatePhone() {
//     if (selectedCountryModel.dialCode == "+41") {
//       if (mobileNumberController.text.isNotEmpty &&
//           mobileNumberController.text.length == 9) {
//         emit(state.copyWith(mobileNumberStatus: MobileNumberStatus.valid));
//         emit(state.copyWith(nextEnableForMobileNumber: true));
//       } else {
//         emit(state.copyWith(mobileNumberStatus: MobileNumberStatus.invalid));
//         emit(state.copyWith(nextEnableForMobileNumber: false));
//       }
//     } else {
//       if (mobileNumberController.text.isNotEmpty &&
//           mobileNumberController.text.length == 10) {
//         emit(state.copyWith(mobileNumberStatus: MobileNumberStatus.valid));
//       } else {
//         emit(state.copyWith(mobileNumberStatus: MobileNumberStatus.invalid));
//       }
//     }
//   }
//
//   void startTimer() {
//     int remainingTime = 120;
//     const oneSecond = Duration(seconds: 1);
//     timer = Timer.periodic(oneSecond, (timer) {
//       if (remainingTime > 0) {
//         remainingTime -= 1;
//         emit(state.copyWith(timer: remainingTime));
//       } else {
//         timer.cancel(); // Stop the timer when the countdown reaches 0
//       }
//     });
//   }
//
//   Future<void> getLoggedIn() async {
//     if (!emailValidatorRegExp.hasMatch(emailController.text)) {
//       log("${!emailValidatorRegExp.hasMatch(emailController.text)}");
//       emit(state.copyWith(errorStatus: ErrorStatus.emailValidationError));
//     } else {
//       showProgressDialog();
//       emit(state.copyWith(status: LoginStatus.loading));
//       final response = await _loginRepository.loginUser({
//         'email': emailController.text.toString(),
//         'password': passController.text.toString(),
//         "fcm_token": await FirebaseMessaging.instance.getToken()
//       });
//       dismissProgressDialog();
//       response.fold(
//         (failure) {
//           log('failure${failure.code}');
//           if (failure.code == 401) {
//             emit(state.copyWith(errorStatus: ErrorStatus.passwordError));
//           } else if (failure.code == 422) {
//             emit(state.copyWith(errorStatus: ErrorStatus.emailError));
//           } else {}
//         },
//         (data) async {
//           emit(state.copyWith(errorStatus: ErrorStatus.initial));
//           _appPreferences.setUserAuthToken(data.data?.token);
//           _appPreferences.setIsUserLoggedIn();
//           _appPreferences
//               .setUserProfileActivationStatus(data.data?.user?.profileStatus);
//           _appPreferences.saveUserData(data.data!.user!);
//           GetContext.to(SignInSuccessPage());
//         },
//       );
//     }
//   }
//
//   void checkEmptyField() {
//     emit(state.copyWith(
//         status: emailController.text.isEmpty ||
//                 passController.text.isEmpty ||
//                 !emailValidatorRegExp.hasMatch(emailController.text)
//             ? LoginStatus.empty
//             : LoginStatus.filled));
//   }
//
//   void fixWrongInput() {
//     emit(state.copyWith(
//         errorStatus: ErrorStatus.initial,
//         status: emailController.text.isEmpty ||
//                 passController.text.isEmpty ||
//                 !emailValidatorRegExp.hasMatch(emailController.text)
//             ? LoginStatus.empty
//             : LoginStatus.filled));
//   }
//
//   void loginReset() {
//     emailController.clear();
//     passController.clear();
//     emit(state.copyWith(
//       status: LoginStatus.empty,
//       errorStatus: ErrorStatus.initial,
//     ));
//   }
//
//   void getGoogleLogin() async {
//     try {
//       showProgressDialog();
//       var result = await _googleSignIn.signIn();
//       print("result of google sign in$result");
//       final GoogleSignInAuthentication googleAuth =
//           await result!.authentication;
//       print("token ${googleAuth.accessToken}");
//       var response = await _loginRepository
//           .getSocialLogin({"token": googleAuth.accessToken}, "google");
//       response.fold((failure) {
//         print("failure social Login: $failure");
//       }, (data) {
//         dismissProgressDialog();
//         _appPreferences.setUserAuthToken(data.data?.token);
//         _appPreferences.setIsUserLoggedIn();
//         _appPreferences.saveUserData(data.data!.user!);
//         GetContext.to(SignInSuccessPage());
//       });
//       print("google id ${result.id}");
//     } catch (error) {
//       print("error from google:$error");
//       dismissProgressDialog();
//     }
//   }
//
//   void getFacebookLogin() async {
//     try {
//       showProgressDialog();
//       final LoginResult result = await FacebookAuth.instance.login(
//         permissions: ['public_profile'],
//       );
//       final AccessToken accessToken = result.accessToken!;
//       print(accessToken.token);
//       var response = await _loginRepository
//           .getSocialLogin({"token": accessToken.token}, "facebook");
//       response.fold((failure) {
//         print("failure social Login: $failure");
//         dismissProgressDialog();
//       }, (data) {
//         dismissProgressDialog();
//         _appPreferences.setUserAuthToken(data.data?.token);
//         _appPreferences.setIsUserLoggedIn();
//         _appPreferences.saveUserData(data.data!.user!);
//         GetContext.to(SignInSuccessPage());
//       });
//     } catch (error) {
//       print("error from facebook:$error");
//       dismissProgressDialog();
//     }
//   }
//
//   void sendOtpVerification({bool resend = false}) async {
//     showProgressDialog();
//     var response = await _loginRepository.getOtpVerificationCode({
//       "phone_number":
//           "${selectedCountryModel.dialCode?.replaceAll("+", "")}${mobileNumberController.text}",
//     });
//     dismissProgressDialog();
//     response.fold((failure) {
//       emit(state.copyWith(mobileNumberStatus: MobileNumberStatus.invalid));
//     }, (data) {
//       emit(state.copyWith(mobileNumberStatus: MobileNumberStatus.valid));
//       resend ? () {} : GetContext.to(const OTPScreens());
//     });
//   }
//
//   void getVerifyOtp() async {
//     showProgressDialog();
//     var response = await _loginRepository.getVerifyOtp(
//       {
//         "otp": otpController.text,
//         "phone_number":
//             "${selectedCountryModel.dialCode?.replaceAll("+", "")}${mobileNumberController.text}",
//         "otp_type": "login"
//       },
//     );
//     // dismissProgressDialog();
//     response.fold((failure) {
//       emit(state.copyWith(otpStatus: OtpStatus.invalid));
//       dismissProgressDialog();
//     }, (data) async {
//       emit(state.copyWith(otpStatus: OtpStatus.valid));
//       getMobileLogin();
//       timer?.cancel();
//     });
//   }
//
//   changeDropDownIcon(bool value) {}
//
//   void getMobileLogin() async {
//     var response = await _loginRepository.getMobileLogin({
//       "phone":
//           "${selectedCountryModel.dialCode?.replaceAll("+", "")}${mobileNumberController.text}",
//       "otp": otpController.text,
//       "fcm_token": await FirebaseMessaging.instance.getToken()
//     });
//     response.fold((failure) {
//       dismissProgressDialog();
//     }, (data) {
//       dismissProgressDialog();
//       _appPreferences.setUserAuthToken(data.data?.token);
//       _appPreferences.setIsUserLoggedIn();
//       _appPreferences
//           .setUserProfileActivationStatus(data.data?.user?.profileStatus);
//       _appPreferences.saveUserData(data.data!.user!);
//       GetContext.offAll(Routes.signInSuccess);
//     });
//   }
//
//   countryArrowIconStateUpdate(bool isOpen) {
//     if (isOpen) {
//       emit(state.copyWith(dropDownIconChangeFlag: true));
//     } else {
//       emit(state.copyWith(dropDownIconChangeFlag: false));
//     }
//   }
// }
