import 'package:flutter/material.dart';
import 'package:constructo/config/themes/colors.dart';

/*
---------------------------------------------
acronyms:
---------------------------------------------
T = Thin
SB = SemiBold
B = Bold
I = Italic
---------------------------------------------
*/

extension CustomStyles on TextTheme {
  TextStyle get title1 => const TextStyle(fontSize: 28.0, fontFamily: 'SF Pro Display');
  TextStyle get title1SB => title1.copyWith(fontWeight: FontWeight.w600);
  TextStyle get title1B => title1.copyWith(fontWeight: FontWeight.w700);
  TextStyle get title2 => const TextStyle(fontSize: 22.0, fontFamily: 'SF Pro Display');
  TextStyle get title2White => title2.copyWith(color: Colors.white);
  TextStyle get title2SB => title2.copyWith(fontWeight: FontWeight.w600);
  TextStyle get title2B => title2.copyWith(fontWeight: FontWeight.w700);
  TextStyle get title2BWhite => title2B.copyWith(color: Colors.white);
  TextStyle get title3 => const TextStyle(fontSize: 20.0, fontFamily: 'SF Pro Display');
  TextStyle get title3SB => title3.copyWith(fontWeight: FontWeight.w600);
  TextStyle get title3SBWhite => title3SB.copyWith(color: Colors.white);
  TextStyle get title3B => title3.copyWith(fontWeight: FontWeight.w700);
  TextStyle get body => const TextStyle(fontSize: 17.0);
  TextStyle get bodyWhite => body.copyWith(color: Colors.white);
  TextStyle get bodyMediumGray => body.copyWith(color: AppColors.grayMedium);
  TextStyle get bodyDarkGray => body.copyWith(color: AppColors.grayDark);
  TextStyle get bodySB => body.copyWith(fontWeight: FontWeight.w600);
  TextStyle get bodySBWhite => bodySB.copyWith(color: Colors.white);
  TextStyle get bodySBMediumGray => bodySB.copyWith(color: AppColors.grayMedium);
  TextStyle get bodyB => body.copyWith(fontWeight: FontWeight.w700);
  TextStyle get callOut => const TextStyle(fontSize: 16.0);
  TextStyle get callOutSB => callOut.copyWith(fontWeight: FontWeight.w600);
  TextStyle get callOutSBWhite => callOutSB.copyWith(color: Colors.white);
  TextStyle get callOutB => callOut.copyWith(fontWeight: FontWeight.w700);
  TextStyle get subHeadline => const TextStyle(fontSize: 15.0);
  TextStyle get subHeadlineWhite => subHeadline.copyWith(color: Colors.white);
  TextStyle get subHeadlineMediumGray => subHeadlineThin.copyWith(color: AppColors.grayMedium);
  TextStyle get subHeadlineThin => subHeadline.copyWith(fontWeight: FontWeight.w200);
  TextStyle get subHeadlineThinWhite => subHeadlineThin.copyWith(color: Colors.white);
  TextStyle get subHeadlineSB => subHeadline.copyWith(fontWeight: FontWeight.w600);
  TextStyle get subHeadlineSBWhite => subHeadlineSB.copyWith(color: Colors.white);
  TextStyle get subHeadlineB => subHeadline.copyWith(fontWeight: FontWeight.w700);
  TextStyle get subHeadlineBWhite => subHeadlineB.copyWith(color: Colors.white);
  TextStyle get footnote => const TextStyle(fontSize: 13.0);
  TextStyle get footnotePrimary => footnote.copyWith(color: AppColors.primary);
  TextStyle get footnoteLightGray => footnote.copyWith(color: AppColors.grayLight);
  TextStyle get footnoteMediumGray => footnote.copyWith(color: AppColors.grayMedium);
  TextStyle get footnoteDarkGray => footnote.copyWith(color: AppColors.grayDark);
  TextStyle get footnoteWhite => footnote.copyWith(color: Colors.white);
  TextStyle get footnoteSB => footnote.copyWith(fontWeight: FontWeight.w600);
  TextStyle get footnoteSBMediumGray => footnoteSB.copyWith(color: AppColors.grayMedium);
  TextStyle get footnoteSBDarkGray => footnoteSB.copyWith(color: AppColors.grayDark);
  TextStyle get footnoteSBPrimary => footnoteSB.copyWith(color: AppColors.primary);
  TextStyle get footnoteSBWhite => footnoteSB.copyWith(color: Colors.white);
  TextStyle get footnoteB => footnote.copyWith(fontWeight: FontWeight.w700);
  TextStyle get footnoteBWhite => footnoteB.copyWith(color: Colors.white);
  TextStyle get footnoteBMediumGray => footnoteB.copyWith(color: AppColors.grayMedium);
  TextStyle get footnoteBDarkGray => footnoteB.copyWith(color: AppColors.grayDark);
  TextStyle get footnoteBPrimary => footnoteB.copyWith(color: AppColors.primary);
  TextStyle get caption1 => const TextStyle(fontSize: 12.0);
  TextStyle get caption1White => caption1.copyWith(color: Colors.white);
  TextStyle get caption1MediumGray => caption1.copyWith(color: AppColors.grayMedium);
  TextStyle get caption1SB => caption1.copyWith(fontWeight: FontWeight.w600);
  TextStyle get caption1SBMediumGray => caption1SB.copyWith(color: AppColors.grayMedium);
  TextStyle get caption1SBDarkGray => caption1SB.copyWith(color: AppColors.grayDark);
  TextStyle get caption1SBPrimary => caption1SB.copyWith(color: AppColors.primary);
  TextStyle get caption1B => caption1.copyWith(fontWeight: FontWeight.w700);
  TextStyle get caption2 => const TextStyle(fontSize: 11.0);
  TextStyle get caption2White => caption2.copyWith(color: Colors.white);
  TextStyle get caption2FadedWhite => caption2.copyWith(color: AppColors.fadedWhite);
  TextStyle get caption2MediumGray => caption2.copyWith(color: AppColors.grayMedium);
  TextStyle get caption2SB => caption2.copyWith(fontWeight: FontWeight.w600);
  TextStyle get caption2SBMediumGray => caption2SB.copyWith(color: AppColors.grayMedium);
  TextStyle get caption2SBDarkGray => caption2SB.copyWith(color: AppColors.grayDark);
  TextStyle get caption2B => caption2.copyWith(fontWeight: FontWeight.w700);
}

TextTheme lightTextTheme = const TextTheme();

TextTheme darkTextTheme = const TextTheme();
