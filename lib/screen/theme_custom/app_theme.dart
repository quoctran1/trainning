import 'package:flutter/material.dart';

abstract class AppStyles {
  late ThemeData themeData;

  TextStyle textStyle({Color? color});

  BoxDecoration copyButtonStyle();
}

class LightAppStyle extends AppStyles {
  @override
  ThemeData get themeData => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.white,
      ),
      appBarTheme: const AppBarTheme(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.black),
      hintColor: Colors.greenAccent,
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.4,
            color: Colors.teal,
            fontWeight: FontWeight.normal,
            fontFamily: 'AppFont.jetBrainsMono'),
        bodyMedium: TextStyle(
            fontSize: 16,
            height: 1.4,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: 'AppFont.jetBrainsMono'),
      ),
      fontFamily: 'AppFont.jetBrainsMono,');

  @override
  BoxDecoration copyButtonStyle() {
    return const BoxDecoration(color: Colors.black);
  }

  @override
  TextStyle textStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.black);
  }
}

class DarkAppStyle extends AppStyles {
  @override
  ThemeData get themeData => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.white,
      ),
      appBarTheme: const AppBarTheme(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.black),
      hintColor: Colors.greenAccent,
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.4,
            color: Colors.teal,
            fontWeight: FontWeight.normal,
            fontFamily: 'AppFont.jetBrainsMono'),
        bodyMedium: TextStyle(
            fontSize: 16,
            height: 1.4,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: 'AppFont.jetBrainsMono'),
      ),
      fontFamily: 'AppFont.jetBrainsMono,');

  @override
  BoxDecoration copyButtonStyle() {
    return const BoxDecoration(color: Colors.black);
  }

  @override
  TextStyle textStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.black);
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late AppStyles styles;

  @override
  void initState() {
    //styles
    styles = LightAppStyle(); // Đổi sang  LightAppStyle()/DarkAppStyle()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: styles.themeData,
      home: Column(
        children: [
          Container(
            decoration: styles.copyButtonStyle(),
            child: Text(
              "Copy button",
              style: styles
                  .textStyle(), // TextStyle sẽ override theo styles đã được set ở trên
            ),
          ),
          Container(
            key: GlobalKey(),
            foregroundDecoration: styles.copyButtonStyle(),
            color: Colors.red,
            clipBehavior: Clip.hardEdge,
            height: 210,
            width: 10,
            alignment: Alignment.centerRight,
            constraints: const BoxConstraints(
              minHeight: 100,
              minWidth: 100,
              maxWidth: 200,
              maxHeight: 200,
            ),
            decoration: BoxDecoration(
                color: const Color(0xe61150e8),
                borderRadius: BorderRadius.circular(
                  20,
                ),
                border: Border.all(color: const Color(0xe68407ec), width: 10),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xe61ea316),
                      Color(0xE6E65337),
                      Color(0xFF76BF88)
                    ])),
            child: const Text('Text'),
          ),
        ],
      ),
    );
  }
}
