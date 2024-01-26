import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppStyles {
  // App
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      centerTitle: true,
      foregroundColor: Colors.white,
    ),
  );
  static const TextStyle appBarTitle = TextStyle(fontWeight: FontWeight.bold);

  // Scaffold body
  static const EdgeInsets bodyMargin = EdgeInsets.all(8.0);
  static const SizedBox verticalSeparator = SizedBox(height: 8.0);
  static const SizedBox horizontalSeparator = SizedBox(width: 8.0);

  // Panel
  static BorderRadius panelBorderRadius = BorderRadius.circular(8.0);
  static Color panelBackgroundColor = Colors.green[100]!;
  static const EdgeInsets panelPadding = EdgeInsets.all(8.0);
  static const TextStyle panelTitle = TextStyle(fontSize: 18);

  // My Progress
  static const double imageHeight = 32;
  static const double imageWidth = 32;
  static const EdgeInsets tableCellPadding =
      EdgeInsets.symmetric(horizontal: 2.0);

  // Message
  static BorderRadius messageBorderRadius = BorderRadius.circular(8.0);
  static const EdgeInsets messagePadding = EdgeInsets.all(8.0);

  // Large button
  static const Size largeButtonSize = Size(250, 60);
}

class ItemManagerStyles {
  // Normal item manager
  static BoxDecoration normalItemManager = BoxDecoration(
    border: Border.all(color: Colors.green),
    borderRadius: BorderRadius.circular(8.0),
  );

  // Normal list view
  static const EdgeInsets normalListViewPadding = EdgeInsets.all(8.0);

  // Full screen list view
  static const EdgeInsets fullScreenListViewPadding = EdgeInsets.all(8.0);

  // Item
  static Border itemBorder = Border.all(color: Colors.green);
  static Border selectedItemBorder = Border.all(color: Colors.blue);
  static BorderRadius itemBorderRadius = BorderRadius.circular(8.0);
  static Color selectedItemBackgroundColor = Colors.blue[100]!;
  static const Color itemCheckboxColor = Colors.blue;
  static const SizedBox itemSeparator = SizedBox(height: 8.0);

  // Action bar
  static BoxDecoration fullScreenActionBarDecoration = BoxDecoration(
    border: const Border(
      top: BorderSide(color: Colors.green),
    ),
    color: Colors.green[100]!,
  );
  static BoxDecoration normalActionBarDecoration = BoxDecoration(
    border: const Border(
      top: BorderSide(color: Colors.green),
    ),
    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8.0)),
    color: Colors.green[100]!,
  );
  static const EdgeInsets actionBarPadding =
      EdgeInsets.symmetric(vertical: 8.0);
}
