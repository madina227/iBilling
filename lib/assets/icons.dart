import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_billing/assets/colors.dart';

//light bottom icons
final contractsOutlIcon = SvgPicture.asset(
  'assets/icons/outlined/document.svg',
  colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
);
final historyOutlIcon = SvgPicture.asset(
    'assets/icons/outlined/time_circle.svg',
    colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn));
final newOutlIcon = SvgPicture.asset('assets/icons/outlined/plus.svg',
    colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn));
final bookmarkOutlIcon = SvgPicture.asset('assets/icons/outlined/bookmark.svg',
    colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn));
final profileOutlIcon = SvgPicture.asset('assets/icons/outlined/profile.svg',
    colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn));

//bold bottom icons
final contractsBoldIcon = SvgPicture.asset('assets/icons/bold/document.svg',
    colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn));
final historyBoldIcon = SvgPicture.asset('assets/icons/bold/time_circle.svg',
    colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn));
final newBoldIcon = SvgPicture.asset('assets/icons/bold/plus.svg',
    colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn));
final bookmarkBoldIcon = SvgPicture.asset('assets/icons/bold/bookmark.svg',
    colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn));
final profileBoldIcon = SvgPicture.asset('assets/icons/bold/profile.svg',
    colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn));

//app icons
final contractIcon = SvgPicture.asset('assets/icons/bold/paper.svg',
    colorFilter: ColorFilter.mode(lightGreen, BlendMode.srcIn));
final invoiceIcon = SvgPicture.asset('assets/icons/bold/invoice.svg',
    colorFilter: ColorFilter.mode(lightGreen, BlendMode.srcIn));
//
final filterIcon = SvgPicture.asset('assets/icons/bold/filter.svg',
    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn));
final searchIcon = SvgPicture.asset('assets/icons/outlined/search.svg',
    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn));

//images
final userPlaceholder = Image.asset('assets/images/user_placeholder.png');
final flagUs = SvgPicture.asset('assets/images/flag_us.svg', fit: BoxFit.fill,);
final contractsIcon = SvgPicture.asset('assets/icons/bold/document.svg', width: 66, height: 73,
    colorFilter: ColorFilter.mode(grey, BlendMode.srcIn));