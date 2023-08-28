import 'package:flutter/material.dart';

const Color portfoliogradient1 = Color(0xFF92E3A9);
const Color portfoliogradient2 = Color(0xFFC7B834);
 Color lightBackgroundColor = Colors.white;
// const Color lightBackgroundColor = Color(0xFFF5F6F7);
const Color darkBackgroundColor = Color(0xFF070400);

const Color darkCardColor = Color(0xFF1E1E1E);
const Color portfolioBg = Color(0xFF292D32);
// const Color darkCardColor = Color(0xFF002b62);
const Color lightCardColor = Colors.white;
const Color darkGrey = Color(0xFFA4A4A4);
 Color lightGrey = Colors.grey.shade300;
const Color secondaryGoldColor = Color(0xFFE7AC63);
const Color appPrimaryColor = Color(0xFF001E45);
// const Color appPrimaryColor = Color(0xFF7C3626);
const Color primaryColorLight = Color(0x99F05E5E);
const Color primaryColorDark = Color(0xFF343434);
const Color redColor = Color(0xFFFF0101);
 Color inputColorLight = Colors.grey.shade200.withOpacity(0.5);
const Color inputColorDark = Color(0xFF211E1E);
const Color uploadButtonColor = Color(0xFFD7D7D7);

const Color darkBottomSheetColor = Color(0xFF252836);
const Color lightBottomSheetColor = Colors.white;

const Color white = Colors.white;
const smokeWhite = Color(0xFFf1f7f8);
const Color black = Colors.black;
const red = Color(0xFFff0000);

const Color gold = Color(0xFFcfa23c);

const secondaryColor = Color(0xFF0864D7);
const gradient = Color(0xFF0e0ba0);
const gradient2 = Color(0xFF02156B);
const textColor = Color(0xFF5f6368);
const chipsColor = Color(0xFF77a1ff);
// const lightGrey = Color(0xFFebebf7);

extension ColorSchemeEx on ColorScheme {
  Color get backgroundColor => brightness == Brightness.dark
      ? darkBackgroundColor
      : lightBackgroundColor;

  Color get toolbarColor => brightness == Brightness.dark
      ? darkBackgroundColor
      : lightBackgroundColor;
}
