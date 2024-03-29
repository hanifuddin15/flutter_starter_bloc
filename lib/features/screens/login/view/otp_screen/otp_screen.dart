// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:pinput/pinput.dart';
// import 'package:shine/core/app/app_context.dart';
// import 'package:shine/features/components/custom_scaffold_body.dart';
// import 'package:shine/features/router/routes.dart';
// import 'package:shine/features/screens/auth/create_account/cubit/create_account_cubit.dart';
//
// import '../../../../../../../core/constants/app_colors.dart';
// import '../../../../../../../core/constants/app_size.dart';
// import '../../../../../../../core/constants/app_strings.dart';
// import '../../../../../components/custom_back_button.dart';
// import '../../../../../components/default_btn.dart';
// import '../../../create_account/view/email_verify_screen.dart';
// import '../../../create_account/view/set_pass_scree.dart';
// import '../../cubit/login_cubit.dart';
//
// class OTPScreens extends StatefulWidget {
//   const OTPScreens({super.key});
//
//   @override
//   State<OTPScreens> createState() => _OTPScreensState();
// }
//
// class _OTPScreensState extends State<OTPScreens> {
//   late final Function? onTermsLinkTap;
//   late final Function? onPrivacyPolicyLinkTap;
//
//   //String validationMessage = "";
//
//   @override
//   void initState() {
//     //validationMessage = AppStrings.sendCodeToMailMessage;
//     super.initState();
//     context.read<LoginCubit>().startTimer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
//       return Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: CustomScaffoldBody(
//           child: RPadding(
//             padding: REdgeInsets.symmetric(horizontal: 24.r),
//             child: Column(
//               children: [
//                 kHeightBox113,
//                 kWidthBox16,
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: CustomBackButton(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//                 kHeightBox28,
//                 Text(
//                   AppStrings.enterYourCodeTitle.tr(),
//                   textAlign: TextAlign.center,
//                   style: kYoungHeadLineMedium.copyWith(
//                       color: AppColors.kBlue4,
//                       fontFamily: kYoungSherifFontFamily),
//                 ),
//                 kHeightBox23,
//                 Text(
//                   state.otpStatus == OtpStatus.invalid
//                       ? AppStrings.mismatchCodeMessage.tr()
//                       : AppStrings.sendCodeToPhoneMessage.tr(),
//                   textAlign: TextAlign.center,
//                   style: kRegularLine16.copyWith(
//                       color: AppColors.kYellow6,
//                       fontFamily: kIBMPlexSansFontFamily),
//                 ),
//                 kHeightBox16,
//                 RichText(
//                   text: TextSpan(
//                     style: kTitleSmallBold.copyWith(
//                         color: state.timer > 0
//                             ? Colors.grey
//                             : AppColors.kPurpleDeep,
//                         fontFamily: kIBMPlexSansFontFamily),
//                     children: [
//                       TextSpan(
//                         text: state.timer > 0
//                             ? "Resend Code : ${state.timer.toString()} "
//                             : AppStrings.resendCodeMessage.tr(),
//                         style: const TextStyle(
//                           decoration: TextDecoration.underline,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = state.timer > 0
//                               ? null
//                               : () {
//                                   context.read<LoginCubit>().startTimer();
//                                   context
//                                       .read<LoginCubit>()
//                                       .sendOtpVerification(resend: true);
//                                 },
//                       ),
//                     ],
//                   ),
//                 ),
//                 kHeightBox88,
//                 Pinput(
//                   controller: context.read<LoginCubit>().otpController,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   androidSmsAutofillMethod:
//                       AndroidSmsAutofillMethod.smsRetrieverApi,
//                   keyboardType: TextInputType.number,
//                   closeKeyboardWhenCompleted: true,
//                   defaultPinTheme: PinTheme(
//                     width: AppWidth.s60,
//                     textStyle: kRegularLine18.copyWith(
//                         color: AppColors.kYellow6Color,
//                         fontSize: 18.0,
//                         fontFamily: kIBMPlexSansFontFamily),
//                     decoration: BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                               color: state.otpStatus == OtpStatus.invalid
//                                   ? AppColors.kErrorColor
//                                   : AppColors.kGreyDeepColor,
//                               width: 2)),
//                     ),
//                   ),
//                   length: 5,
//                   onChanged: (val) {
//                     setState(() {});
//                   },
//                 ),
//                 16.verticalSpace,
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Visibility(
//                     visible: state.otpStatus == OtpStatus.invalid,
//                     child: Text(
//                       AppStrings.wrongOTPMessage.tr(),
//                       style:
//                           kTitleMedium.copyWith(color: AppColors.kErrorColor),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.all(17.0),
//           child: SizedBox(
//             width: AppWidth.s273,
//             height: AppHeight.s43,
//             child: DefaultBtn(
//               title: AppStrings.continueTitle.tr(),
//               textColor: AppColors.kWhiteColor,
//               btnColor: context
//                           .read<LoginCubit>()
//                           .otpController
//                           .text
//                           .toString()
//                           .length ==
//                       5
//                   ? Colors.transparent
//                   : AppColors.kGrey6Color,
//               gradient: AppColors.linearGradient,
//               radius: AppCommonSize.s8,
//               fontSize: AppTextSize.s16,
//               fontWeight: largeBoldFont,
//               onPress: () async {
//                 context.read<LoginCubit>().getVerifyOtp();
//               },
//             ),
//           ),
//         ),
//       );
//       ;
//     });
//   }
// }
