import 'package:flutter/material.dart';
import 'app_colors.dart';

enum AppTheme { defaultTheme, darkTheme, colorFulTheme, cuteTheme }

class AppThemes {
  static final appThemeData = {
    // Default Theme
    AppTheme.defaultTheme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.default5),
        primarySwatch: Colors.grey,
        primaryColor: AppColors.default3,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(),
        dividerColor: AppColors.default5,
        // ignore: deprecated_member_use
        toggleableActiveColor: AppColors.default5,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white),
        iconTheme: const IconThemeData(
          // color: AppColors.default4,
          color: Color.fromARGB(255, 46, 46, 46),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(
              AppColors.default5,
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(color: AppColors.default2),
          titleMedium: TextStyle(color: AppColors.default2),
          titleLarge:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(AppColors.default4),
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.green; // Active (on) thumb color
              }
              return Colors.grey; // Inactive (off) thumb color
            },
          ),
          trackColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.greenAccent; // Active (on) track color
              }
              return Colors.grey; // Inactive (off) track color
            },
          ),
        )),

    //Dark Theme
    AppTheme.darkTheme: ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.dark5),
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(),
      dividerColor: AppColors.dark4,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleLarge:
            TextStyle(color: AppColors.dark3, fontWeight: FontWeight.bold),
      ),
      // ignore: deprecated_member_use
      toggleableActiveColor: AppColors.dark3,
      iconTheme: const IconThemeData(color: AppColors.dark1),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(
            AppColors.dark3,
          ),
        ),
      ),
    ),

    //Colorful Theme
    AppTheme.colorFulTheme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColors.colorFul3,
      ),
      primarySwatch: Colors.grey,
      primaryColor: AppColors.colorFul5,
      brightness: Brightness.light,
      colorScheme: lightColorScheme,
      // backgroundColor: const Color(0xFF212121),
      dividerColor: AppColors.colorFul1,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
          titleSmall: TextStyle(color: AppColors.colorFul4),
          titleMedium: TextStyle(color: AppColors.colorFul4),
          titleLarge: TextStyle(
              color: AppColors.colorFul1, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.black)),
      iconTheme: const IconThemeData(color: AppColors.colorFul3),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(
            AppColors.colorFul3,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.colorFul3),
        ),
      ),
      // ignore: deprecated_member_use
      toggleableActiveColor: AppColors.colorFul1,
    ),

    //Cute Theme
    AppTheme.cuteTheme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF687DAF),
      ),
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.light,
      colorScheme: lightColorScheme,
      dividerColor: AppColors.cute3,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.black87),
        titleMedium: TextStyle(color: Colors.black87),
        titleLarge:
            TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.cute3))),
      cardColor: AppColors.cute2,
      iconTheme: const IconThemeData(color: Color(0xFF687DAF)),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(
            AppColors.cute3,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      toggleableActiveColor: const Color(0xFF687DAF),
    ),
  };
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF687DAF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFFf37b67),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color.fromARGB(255, 117, 240, 240),
  onBackground: Color(0xFF3b3b3b),
  surface: Color.fromARGB(255, 54, 210, 210),
  onSurface: Color(0xFF3b3b3b),
);
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFADC6FF),
  onPrimary: Color(0xFF002E69),
  secondary: Color(0xFFBBC6E4),
  onSecondary: Color(0xFF253048),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE3E2E6),
);
