import 'package:flutter/material.dart';
import 'widgets/homepage_widget.dart';
import 'widgets/loginpage_widget.dart'; // Example screen imports

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedback System',
      theme: _buildThemeData(),
      initialRoute: '/feedbacksystem',
      routes: {
        '/homepage': (context) => FeedbackHomePage()
        '/login': (context) => UserLoginPage(),  // Your login page route
        '/checkreport': (context) => CheckReportPage(), // Example route for check report page
      },
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      hintColor: Color(0xFFEB1555),
      textTheme: _buildTextTheme(),
      appBarTheme: _buildAppBarTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
    );
  }

  TextTheme _buildTextTheme() {
    return TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black54,
      ),
    );
  }

  AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyText2,
      titleTextStyle: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ).headline6,
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFEB1555),
        textStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
