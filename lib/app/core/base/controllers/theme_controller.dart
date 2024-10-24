import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/base/constants/appcolor.dart';

class ThemeController extends GetxController {
  final Rx<ThemeData> _themeData = lightTheme.obs;

  ThemeData get themeData => _themeData.value;
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Colors.white,
      entryModeIconColor: Colors.black,

      dialTextColor: Colors.black,
      dialTextStyle: TextStyle(color: Colors.black),
      helpTextStyle: TextStyle(color: Colors.black),
      dayPeriodColor: Colors.white,

      dayPeriodTextColor: Colors.black,
      // hourMinuteColor: Colors.black,
      hourMinuteTextColor: Colors.black,
    ),

    datePickerTheme: const DatePickerThemeData(
      todayForegroundColor: WidgetStatePropertyAll(Colors.black),
      weekdayStyle: TextStyle(color: Colors.black),
      yearForegroundColor:
          WidgetStatePropertyAll(Color.fromARGB(255, 168, 144, 144)),
      dayForegroundColor: WidgetStatePropertyAll(Colors.black),
      headerForegroundColor: Colors.black,
    ),

    listTileTheme: const ListTileThemeData(
        subtitleTextStyle: TextStyle(color: Colors.black),
        textColor: Colors.black),
    iconTheme: const IconThemeData(
      color: AppColors.customGreen,
    ),

    // navigationRailTheme: const NavigationRailThemeData(
    //   indicatorColor:
    //       AppColors.customGreen, // Customize the color of the indicator

    //   unselectedIconTheme: IconThemeData(
    //       color: AppColors
    //           .customGreen // Custo // Customize the color for unselected icons
    //       ),
    //   unselectedLabelTextStyle: TextStyle(
    //       color: AppColors
    //           .customGreen // Custo// Customize the color for the selected label
    //       ),
    //   selectedLabelTextStyle: TextStyle(
    //     color:
    //         AppColors.customGreen, // Customize the color for the selected label
    //   ),
    //   selectedIconTheme: IconThemeData(
    //     color: Colors.white, // Customize the color for the selected icon
    //   ),
    //   backgroundColor: AppColors.backgroundGreen, // C,
    // ),

    // primarySwatch:Color.fromRGBO(16, 138, 0, 1),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
      ),
      displayMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red, // Error border color
        ),
        borderRadius: BorderRadius.circular(4.0), // Error border radius
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red, // Focused error border color
        ),
        borderRadius: BorderRadius.circular(4.0), // Focused error border radius
      ),
    ),

    colorScheme: AppColorSchemes.lightColorScheme,
    // primaryColor:
    //     AppColors.navyBlue, // Set the primary color for the AppBar
    useMaterial3: true,
    // navigationBarTheme: NavigationBarThemeData(
    //   indicatorColor: AppColors.navyBlue.withOpacity(0.3),
    //   labelTextStyle: MaterialStateProperty.resolveWith((states) =>
    //       states.contains(MaterialState.selected)
    //           ? const TextStyle()
    //           : const TextStyle()),
    // ),

    appBarTheme: AppBarTheme(
      color: AppColors.navyBlue,
      iconTheme: const IconThemeData(color: AppColors.white),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.white, // Set text color to white
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.white, // Set text color to white
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    cardColor: const Color.fromARGB(255, 15, 12, 12),

    datePickerTheme: const DatePickerThemeData(
        todayForegroundColor: WidgetStatePropertyAll(Colors.white),
        weekdayStyle: TextStyle(color: Colors.white),
        yearForegroundColor: WidgetStatePropertyAll(Colors.white),
        dayForegroundColor: WidgetStatePropertyAll(
          Colors.white,
        )),
    // iconTheme: IconThemeData(
    //   color: lightColorScheme.primary,
    // ),
    // navigationRailTheme: const NavigationRailThemeData(
    //   indicatorColor: AppColors.customGreen,
    //   unselectedIconTheme: IconThemeData(
    //     color: AppColors.customGreen,
    //   ),
    //   unselectedLabelTextStyle: TextStyle(
    //     color: AppColors.customGreen,
    //   ),
    //   selectedLabelTextStyle: TextStyle(
    //     color: AppColors.customGreen,
    //   ),
    //   selectedIconTheme: IconThemeData(
    //     color: Colors.white,
    //   ),
    //   backgroundColor: AppColors.backgroundGreen,
    // ),

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    colorScheme: AppColorSchemes.darkColorScheme,
    appBarTheme: AppBarTheme(
      color: AppColors.navyBlue,
      iconTheme: const IconThemeData(color: AppColors.white),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
    ),
  );

  void changeTheme(ThemeData newTheme) {
    _themeData.value = newTheme;
    Get.changeTheme(newTheme);
  }

  void toggleTheme() {
    changeTheme(_themeData.value == lightTheme ? darkTheme : lightTheme);
  }

  bool isDarkTheme() {
    return _themeData.value == darkTheme;
  }
}
