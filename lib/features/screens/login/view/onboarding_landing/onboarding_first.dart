// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shine/core/app/app_context.dart';
// import 'package:shine/features/components/custom_footer.dart';
// import 'package:shine/features/components/custom_scaffold_body.dart';
//
// import '../../../../../../core/constants/app_colors.dart';
// import '../../../../../../core/constants/app_images.dart';
// import '../../../../../../core/constants/app_size.dart';
// import '../../../../../../core/constants/app_strings.dart';
// import '../../../../../components/default_btn.dart';
// import '../../../../../router/routes.dart';
// import '../../../create_account/view/select_language_screen.dart';
// import '../onboarding_signin_methods/onboarding_signin_methods.dart';
//
// class OnboardingFirstPage extends StatelessWidget {
//   const OnboardingFirstPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: CustomScaffoldBody(
//         child: RPadding(
//           padding: REdgeInsets.symmetric(horizontal: 30.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.asset(
//                   AppImages.shineLogoPNG,
//                   height: 75.h,
//                   width: 170.w,
//                   alignment: Alignment.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: RPadding(
//         padding: REdgeInsets.all(17.0).r,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               height: 48.h,
//               child: DefaultBtn(
//                 title: AppStrings.createAccountTitle.tr(),
//                 onPress: () async {
//                   GetContext.to(const SelectLanguageScreen());
//                   //GetContext.offAll(Routes.selectLanguageScreen);
//                   //GetContext.offAll(Routes.generalInfoNewPages);
//                 },
//                 textColor: AppColors.kWhiteColor,
//                 gradient: AppColors.linearGradient,
//                 radius: 8.r,
//                 fontSize: 16.sp,
//                 fontWeight: semiBoldFont,
//               ),
//             ),
//             kHeightBox20,
//             SizedBox(
//               width: double.infinity,
//               height: 48.h,
//               child: DefaultBtn(
//                 btnColor: AppColors.kWhiteColor,
//                 title: AppStrings.signInTitle.tr(),
//                 textColor: AppColors.kPurpleDeep,
//                 radius: 8.r,
//                 border: 1.0,
//                 fontSize: 16.sp,
//                 fontWeight: semiBoldFont,
//                 borderColor: AppColors.kPurpleDeep,
//                 onPress: () async {
//                   GetContext.to(const OnboardingSignInMethodsPage());
//                 },
//               ),
//             ),
//             50.verticalSpace,
//             const Divider(
//               color: AppColors.kTertiary200,
//               thickness: 1,
//             ),
//             10.verticalSpace,
//             const CustomFooterText()
//           ],
//         ),
//       ),
//     );
//   }
// }
