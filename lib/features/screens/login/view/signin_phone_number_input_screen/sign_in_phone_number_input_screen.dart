// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:easy_localization/easy_localization.dart' as EasyLocalization;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shine/core/app/app_context.dart';
// import 'package:shine/features/components/custom_scaffold_body.dart';
// import 'package:shine/features/components/custom_text_field.dart';
//
// import '../../../../../../../core/constants/app_colors.dart';
// import '../../../../../../../core/constants/app_size.dart';
// import '../../../../../../../core/constants/app_strings.dart';
// import '../../../../../components/custom_back_button.dart';
// import '../../../../../components/default_btn.dart';
// import '../../../../onboarding/models/country_model.dart';
// import '../../cubit/login_cubit.dart';
//
// class PhoneNumberScreen extends StatefulWidget {
//   const PhoneNumberScreen({super.key});
//
//   @override
//   State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
// }
//
// class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
//       return Scaffold(
//         body: CustomScaffoldBody(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.r),
//             child: Column(
//               children: [
//                 80.verticalSpace,
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: CustomBackButton(
//                     onTap: () {
//                       GetContext.back();
//                     },
//                   ),
//                 ),
//                 kHeightBox28,
//                 Text(
//                   AppStrings.getPhoneNumberText1.tr(),
//                   textAlign: TextAlign.center,
//                   style: kYoungHeadLineMedium.copyWith(
//                       color: AppColors.kBlue4),
//                 ),
//                 Text(AppStrings.getPhoneNumberText2.tr(),
//                     textAlign: TextAlign.center,
//                     style: kYoungHeadLineMedium.copyWith(
//                         color: AppColors.kBlue4)),
//                 kHeightBox63,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     DropdownButtonHideUnderline(
//                       child: DropdownButton2<CountryModel>(
//                         isExpanded: true,
//                         isDense: false,
//                         hint:  Row(
//                           children: [
//                             CachedNetworkImage(
//                               imageUrl: countryList[0].flag.toString(),
//                               height: AppHeight.s16,
//                               width: AppWidth.s20,
//                             ),
//                             kWidthBox10,
//                             Text(
//                               "${countryList[0].code.toString()} ${countryList[0].dialCode.toString()}",
//                               style: kRegularLine18.copyWith(
//                                   fontFamily:
//                                   kIBMPlexSansFontFamily,
//                                   color: AppColors.kYellow6),
//                             ),
//                           ],
//                         ),
//                         items: countryList
//                             .map((item) => DropdownMenuItem(
//                           value: item,
//                           child:  Row(
//                             children: [
//                               CachedNetworkImage(
//                                 imageUrl: item.flag
//                                     .toString(),
//                                 height: AppHeight.s16,
//                                 width: AppWidth.s20,
//                               ),
//                               10.horizontalSpace,
//                               Text(
//                                 //"${item.flag.toString()} ${item.code} ${item.dialCode}",
//                                 "${item.code} ${item.dialCode}",
//                                 style: kRegularLine18
//                                     .copyWith(
//                                     fontFamily:
//                                     kIBMPlexSansFontFamily,
//                                     color: AppColors
//                                         .kYellow6),
//                               ),
//                             ],
//                           ),
//                         ))
//                             .toList(),
//                         value: state.selectedCountryModel,
//                         onChanged: (value) {
//                           context
//                               .read<LoginCubit>()
//                               .getCountryCode(value!);
//                         },
//                         buttonStyleData: ButtonStyleData(
//                           height: .14.sw,
//                           width: AppWidth.s160,
//                           //padding: EdgeInsets.only(left: AppWidth.s14, right: AppWidth.s14),
//                           padding: EdgeInsets.only(
//                               left: AppWidth.s10,
//                               right: AppWidth.s5),
//                           decoration: BoxDecoration(
//                             //borderRadius: BorderRadius.only(topLeft: Radius.circular(AppCommonSize.s8),topRight: Radius.circular(AppCommonSize.s8)),
//                             borderRadius: BorderRadius.circular(
//                                 AppCommonSize.s8),
//                             color: AppColors.kWhiteColor,
//                           ),
//                           elevation: 0,
//                         ),
//                         dropdownStyleData: DropdownStyleData(
//                             maxHeight: AppHeight.s400,
//                             width: AppWidth.s160,
//                             useSafeArea: true,
//                             elevation: 8,
//                             padding: EdgeInsets.zero,
//                             decoration: const BoxDecoration(
//                                 color: AppColors.kLightMorePurple)),
//                         menuItemStyleData: MenuItemStyleData(
//                             height: AppHeight.s40,
//                             overlayColor:
//                             const MaterialStatePropertyAll(
//                                 AppColors.kBlue2Color)),
//                         iconStyleData: IconStyleData(
//                             icon:  state.dropDownIconChangeFlag == true ? const Icon(Icons.arrow_drop_up) : const Icon(Icons.arrow_drop_down)
//                         ),
//                         onMenuStateChange: (isOpen) {
//                           context
//                               .read<LoginCubit>()
//                               .countryArrowIconStateUpdate(isOpen);
//                         },
//                       ),
//                     ),
//                     Container(
//                       constraints: BoxConstraints(maxWidth: .5.sw),
//                       child: CustomTextField(
//                         keyboardType: TextInputType.number,
//                         textStyle: kRegularLine18.copyWith(
//                             fontFamily: kIBMPlexSansFontFamily,
//                             color: AppColors.kYellow6),
//                         controller: context
//                             .read<LoginCubit>()
//                             .mobileNumberController,
//                         isError: state.mobileNumberStatus == MobileNumberStatus.invalid ? true : false,
//                         onChanged: (value) {
//                           context.read<LoginCubit>().getValidatePhone();
//                         },
//                         // isError: state.mobileNumberStatus ==
//                         //     MobileNumberStatus.invalid,
//                       ),
//                     ),
//                     // ),
//                   ],
//                 ),
//                 40.verticalSpace,
//                 RPadding(
//                   padding: REdgeInsets.symmetric(horizontal: 32.0.r),
//                   child: Text(
//                       AppStrings.getPhoneNumberInsideText1.tr() +
//                           AppStrings.getPhoneNumberInsideText2.tr(),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         decorationColor: AppColors.kBlue5,
//                         fontFamily: kIBMPlexSansFontFamily,
//                         fontSize: AppTextSize.s12,
//                         fontWeight: regularFont,
//                         color: AppColors.kBlue5,
//                       )),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButtonLocation:
//             FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 17.r,vertical: 17.r),
//           child: SizedBox(
//             width: AppWidth.s273,
//             height: AppHeight.s43,
//             child: DefaultBtn(
//               btnColor: state.mobileNumberStatus==MobileNumberStatus.valid
//                   ? AppColors.kTransparentColor
//                   : AppColors.kGreyDeep2Color,
//               gradient: AppColors.linearGradient,
//               title: AppStrings.nextTitle.tr(),
//               textColor: AppColors.kWhiteColor,
//               radius: AppCommonSize.s8,
//               fontSize: AppTextSize.s16,
//               fontWeight: semiBoldFont,
//               onPress: () async {
//                 if (state.mobileNumberStatus ==MobileNumberStatus.valid) {
//                   // GetContext.to(const OTPScreens());
//                   context.read<LoginCubit>().sendOtpVerification();
//                 }
//               },
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
