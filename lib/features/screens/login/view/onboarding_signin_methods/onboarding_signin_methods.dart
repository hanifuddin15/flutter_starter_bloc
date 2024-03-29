// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shine/features/components/custom_footer_create_account.dart';
//
// import 'package:shine/features/components/custom_scaffold_body.dart';
// import 'package:shine/features/screens/auth/login/cubit/login_cubit.dart';
// import 'package:shine/features/screens/auth/login/view/sign_in_email_screen.dart';
// import 'package:shine/features/screens/auth/success/signin_success_page.dart';
//
// import '../../../../../../../core/constants/app_colors.dart';
// import '../../../../../../../core/constants/app_images.dart';
// import '../../../../../../../core/constants/app_size.dart';
// import '../../../../../../../core/constants/app_strings.dart';
// import '../../../../../../core/app/app_context.dart';
// import '../../../../../components/default_btn.dart';
// import '../../../../../components/default_btn_2.dart';
// import '../signin_phone_number_input_screen/sign_in_phone_number_input_screen.dart';
//
// class OnboardingSignInMethodsPage extends StatelessWidget {
//   const OnboardingSignInMethodsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: CustomScaffoldBody(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 kHeightBox160,
//                 Text(AppStrings.signInTitle.tr(),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: kYoungSherifFontFamily,
//                       fontSize: AppTextSize.s28,
//                       fontWeight: regularFont,
//                       color: AppColors.kBlue4,
//                     )),
//                 kHeightBox90,
//                 Center(
//                   child: Image.asset(
//                     AppImages.shineLogoSvgNew,
//                     height: AppHeight.s75,
//                     width: AppWidth.s170,
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 kHeightBox150,
//                 /*--------Sign In With Phone Number----------*/
//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.0.w, right:20.w),
//                   child: SizedBox(
//                     width: double.infinity, //double.infinity,
//                     height: AppHeight.s48,
//                     child: DefaultBtn2(
//                       iconSpaceFromLeft: 16.w,
//                       iconToTextSpacing: 44.w,
//                       isIconEnable: true,
//                       isCenter: false,
//                       icon: AppImages.dialpadIcon,
//                       iconHeight: AppCommonSize.s22,
//                       iconWidth: AppCommonSize.s22,
//                       iconColor: AppColors.kWhiteColor,
//                       title: AppStrings.signInWithPhone.tr(),
//                       fontFamily: kIBMPlexSansFontFamily,
//                       onPress: () async {
//                         GetContext.to(
//                             const PhoneNumberScreen());
//                       },
//                       textColor: AppColors.kWhiteColor,
//                       gradient: AppColors.linearGradient,
//                       radius: AppCommonSize.s8,
//                       fontSize: AppTextSize.s16,
//                       fontWeight: semiBoldFont,
//                     ),
//                   ),
//                 ),
//                 kHeightBox12,
//                 /*--------Sign In With Google----------*/
//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.0.w, right:20.w),
//                   child: SizedBox(
//                     width: double.infinity, //double.infinity,
//                     height: AppHeight.s48,
//                     child: DefaultBtn2(
//                       iconSpaceFromLeft: 16.w,
//                       iconToTextSpacing: 74.w,
//                       isIconEnable: true,
//                       isCenter: false,
//                       icon: AppImages.googleIcon,
//                       iconHeight: AppCommonSize.s22,
//                       iconWidth: AppCommonSize.s22,
//                       iconColor: AppColors.kWhiteColor,
//                       title: AppStrings.signInWithGoogle.tr(),
//                       fontFamily: kIBMPlexSansFontFamily,
//                       onPress: () async {
//                         context.read<LoginCubit>().getGoogleLogin();
//                       },
//                       textColor: AppColors.kWhiteColor,
//                       gradient: AppColors.linearGradient,
//                       radius: AppCommonSize.s8,
//                       fontSize: AppTextSize.s16,
//                       fontWeight: semiBoldFont,
//                     ),
//                   ),
//                 ),
//                 kHeightBox12,
//                 /*--------Sign In With Facebook----------*/
//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.0.w, right:20.w),
//                   child: SizedBox(
//                     width: double.infinity, //double.infinity,
//                     height: AppHeight.s48,
//                     child: DefaultBtn2(
//                       iconSpaceFromLeft: 16.w,
//                       iconToTextSpacing: 72.w,
//                       isIconEnable: true,
//                       isCenter: false,
//                       icon: AppImages.facebookIcon,
//                       iconHeight: AppCommonSize.s22,
//                       iconWidth: AppCommonSize.s18,
//                       iconColor: AppColors.kWhiteColor,
//                       title: AppStrings.signInWithFacebook.tr(),
//                       fontFamily: kIBMPlexSansFontFamily,
//                       onPress: () async {
//                         context.read<LoginCubit>().getFacebookLogin();
//                       },
//                       textColor: AppColors.kWhiteColor,
//                       gradient: AppColors.linearGradient,
//                       radius: AppCommonSize.s8,
//                       fontSize: AppTextSize.s16,
//                       fontWeight: semiBoldFont,
//                     ),
//                   ),
//                 ),
//                 kHeightBox12,
//
//                 /*--------Sign In With Email & Password----------*/
//                 Padding(
//                   padding:  EdgeInsets.only(left: 20.0.w, right:20.w),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: AppHeight.s48,
//                     child: DefaultBtn2(
//                       // iconSpaceFromLeft: 16.w,
//                       iconToTextSpacing: 35.w,
//                       isIconEnable: true,
//                       isCenter: true,
//                       icon: AppImages.mailIcon,
//                       iconHeight: AppCommonSize.s22,
//                       iconWidth: AppCommonSize.s18,
//                       iconColor: AppColors.kWhiteColor,
//                       title: AppStrings.signInWithEmailandPassword.tr(),
//                       fontFamily: kIBMPlexSansFontFamily,
//                       onPress: () async {
//                         GetContext.to(SignInEmailScreen());
//                       },
//                       textColor: AppColors.kWhiteColor,
//                       gradient: AppColors.linearGradient,
//                       radius: AppCommonSize.s8,
//                       fontSize: 16.sp,
//                       fontWeight: semiBoldFont,
//                     ),
//                   ),
//                 ),
//                 kHeightBox35,
//                 Divider(
//                   color: AppColors.kTertiary200,
//                   indent: AppWidth.s17,
//                   endIndent: AppWidth.s17,
//                   thickness: 1,
//                 ),
//                 kHeightBox10,
//                 const CustomFooterTextForCreateAccount(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }