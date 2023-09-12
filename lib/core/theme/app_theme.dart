import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:easy_cook/core/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_colors.dart' as app_colors;

class AppTheme {
  //

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFBFDF9),
    colorScheme: lightColorScheme,
    useMaterial3: true,
    textTheme: textTheme,
  );

  static final transparentAppBrTheme = AppBarTheme(
    // color: app_colors.lightBackgroundColor,
    // foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
    // toolbarTextStyle: const TextStyle(
    //   color: app_colors.white,
    // ),
    // titleSpacing: 0,
    // iconTheme: const IconThemeData(
    //   color: app_colors.appPrimaryColor,
    // ),
  );

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //   SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF191C1B),
    cardColor: app_colors.darkCardColor,
    primaryColor: app_colors.appPrimaryColor,
    colorScheme: darkColorScheme,
    cardTheme: const CardTheme(
      color: app_colors.darkCardColor,
    ),
    textTheme: textTheme,
  );
  static BoxDecoration cardDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade50.withOpacity(0.5), width: 4),
      boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 10), blurRadius: 7)
      ]);
  static BoxDecoration reminderCardDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade50.withOpacity(0.5), width: 4),
      boxShadow: const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 10), blurRadius: 7)
      ]);
  static InputDecoration filledTextFieldDecoration = InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
    border: OutlineInputBorder(
        gapPadding: 2,
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10)),
  );

  static Future<bool> getPhoneTheme() async {
    try {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
      // }
    } catch (e) {
      debugPrint('Fetch theme error:${e.toString()}');
      return false;
    }
  }

  static Future<bool> getThemeValue() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      // bool value = preferences.getBool(Constants.themeKey)!;
      await initializeTheme();
      String themeMode = preferences.getString(Constants.themeMode)!;

      if (themeMode == 'PHONE') {
        debugPrint('Theme value:PHONE');
        return await getPhoneTheme();
      } else if (themeMode == 'DARK') {
        debugPrint('Theme value:DARK');
        return true;
      } else if (themeMode == 'LIGHT') {
        debugPrint('Theme value:LIGHT');
        return false;
      } else {
        return false;
      }

      // }
    } catch (e) {
      debugPrint('Fetch theme error:${e.toString()}');
      return false;
    }
  }

  static Future<void> initializeTheme() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      String? themeMode = preferences.getString(Constants.themeMode);
      if (themeMode == null) {
        setThemeMode('PHONE');
      }

      debugPrint('Theme value:$themeMode');

      // }
    } catch (e) {
      debugPrint('Fetch theme error:${e.toString()}');
    }
  }

  static Future<void> setThemeMode(String val) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      bool value = await preferences.setString(Constants.themeMode, val);
      debugPrint("ThemeMode set :$value");
    } catch (e) {
      debugPrint('Set theme mode error:${e.toString()}');
    }
  }

  static Future<bool> setThemeValue(bool val) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      bool value = await preferences.setBool(Constants.themeMode, val);
      debugPrint("Theme set to:$value");
      return val;
    } catch (e) {
      debugPrint('Set theme error:${e.toString()}');
      return false;
    }
  }

  static Future<bool> get isFirstTimeUser async {
    try {
      var preferences = await SharedPreferences.getInstance();
      var object = preferences.get(Constants.firstTimeUserKey);
      if (object == null) {
        return true;
      } else {
        bool value = preferences.getBool(Constants.firstTimeUserKey)!;
        return value;
      }
    } catch (e) {
      debugPrint('get first time user error:${e.toString()}');
      return false;
    }
  }

  static Future<bool> setFirstTimeUser(bool val) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      bool value = await preferences.setBool(Constants.firstTimeUserKey, val);
      debugPrint("First time user set to:$value");
      return val;
    } catch (e) {
      debugPrint('Set First time user error:${e.toString()}');
      return false;
    }
  }

  static Color alphaBlend(Color foreground, Color background) {
    final int alpha = foreground.alpha;
    if (alpha == 0x00) {
      // Foreground completely transparent.
      return background;
    }
    final int invAlpha = 0xff - alpha;
    int backAlpha = background.alpha;
    if (backAlpha == 0xff) {
      // Opaque background case
      return Color.fromARGB(
        0xff,
        (alpha * foreground.red + invAlpha * background.red) ~/ 0xff,
        (alpha * foreground.green + invAlpha * background.green) ~/ 0xff,
        (alpha * foreground.blue + invAlpha * background.blue) ~/ 0xff,
      );
    } else {
      // General case
      backAlpha = (backAlpha * invAlpha) ~/ 0xff;
      final int outAlpha = alpha + backAlpha;
      assert(outAlpha != 0x00);
      return Color.fromARGB(
        outAlpha,
        (foreground.red * alpha + background.red * backAlpha) ~/ outAlpha,
        (foreground.green * alpha + background.green * backAlpha) ~/ outAlpha,
        (foreground.blue * alpha + background.blue * backAlpha) ~/ outAlpha,
      );
    }
  }

  static Color getTextColor(Color color) {
    int d = 0;
// Counting the perceptive luminance - human eye favors green color...
    double luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

    if (luminance > 0.5) {
      d = 0;
    } else {
      d = 255;
    } // dark colors - white font

    return Color.fromARGB(color.alpha, d, d, d);
  }

  static InputDecoration inputDecoration(BuildContext context) =>
      InputDecoration(
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16.0,
        ),
        filled: true,
        counterStyle: const TextStyle(color: Colors.blueGrey),
        fillColor: Theme.of(context).cardColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        // enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //     borderSide: BorderSide(
        //       color: Theme.of(context).colorScheme.secondary,
        //     )),
        // focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //     borderSide: BorderSide(
        //       color: Theme.of(context).colorScheme.secondary,
        //     )),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //     borderSide: BorderSide(
        //       color: Theme.of(context).colorScheme.secondary,
        // )
        // )
      );

  static BoxDecoration iconContainerDecoration(Color color) =>
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: color);

  static BoxDecoration roundedBottomDecoration(Color color) => BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(17), topLeft: Radius.circular(17)));

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF048969),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF82F8CF),
    onPrimaryContainer: Color(0xFF002117),
    secondary: Color(0xFF4C6359),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCEE9DC),
    onSecondaryContainer: Color(0xFF082018),
    tertiary: Color(0xFF3F6375),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC3E8FE),
    onTertiaryContainer: Color(0xFF001E2B),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFDF9),
    onBackground: Color(0xFF191C1B),
    surface: Color(0xFFFBFDF9),
    onSurface: Color(0xFF191C1B),
    surfaceVariant: Color(0xFFDBE5DE),
    onSurfaceVariant: Color(0xFF404944),
    outline: Color(0xFF707974),
    onInverseSurface: Color(0xFFEFF1EE),
    inverseSurface: Color(0xFF2E312F),
    inversePrimary: Color(0xFF64DBB4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006C52),
    outlineVariant: Color(0xFFBFC9C3),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // primary: Color(0xFF048969),
    primary: Color(0xFF64DBB4),
    onPrimary: Color(0xFF003829),
    primaryContainer: Color(0xFF00513D),
    onPrimaryContainer: Color(0xFF82F8CF),
    secondary: Color(0xFFB2CCC0),
    onSecondary: Color(0xFF1E352C),
    secondaryContainer: Color(0xFF344C42),
    onSecondaryContainer: Color(0xFFCEE9DC),
    tertiary: Color(0xFFA7CCE1),
    onTertiary: Color(0xFF0B3445),
    tertiaryContainer: Color(0xFF274B5D),
    onTertiaryContainer: Color(0xFFC3E8FE),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1B),
    onBackground: Color(0xFFE1E3E0),
    surface: Color(0xFF191C1B),
    onSurface: Color(0xFFE1E3E0),
    surfaceVariant: Color(0xFF404944),
    onSurfaceVariant: Color(0xFFBFC9C3),
    outline: Color(0xFF89938D),
    onInverseSurface: Color(0xFF191C1B),
    inverseSurface: Color(0xFFE1E3E0),
    inversePrimary: Color(0xFF006C52),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF64DBB4),
    outlineVariant: Color(0xFF404944),
    scrim: Color(0xFF000000),
  );

  static var textTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
        fontSize: 98, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    displayMedium: GoogleFonts.montserrat(
        fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    displaySmall:
        GoogleFonts.montserrat(fontSize: 49, fontWeight: FontWeight.w400),
    headlineMedium: GoogleFonts.montserrat(
        fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headlineSmall:
        GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge: GoogleFonts.montserrat(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleMedium: GoogleFonts.montserrat(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    titleSmall: GoogleFonts.montserrat(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge: GoogleFonts.montserrat(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyMedium: GoogleFonts.montserrat(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    labelLarge: GoogleFonts.montserrat(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    bodySmall: GoogleFonts.montserrat(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    labelSmall: GoogleFonts.montserrat(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
