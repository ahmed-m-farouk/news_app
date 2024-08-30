import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkthemth() => ThemeData(
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: const Color.fromARGB(221, 64, 63, 63),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(221, 64, 63, 63),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(221, 64, 63, 63),
          statusBarIconBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color.fromARGB(221, 64, 63, 63),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple[900],
        elevation: 15,
        selectedIconTheme: IconThemeData(color: Colors.deepPurple),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          color: Colors.white,
        ),
      ),
    );

ThemeData lightThemeh() => ThemeData(
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 15,
        selectedIconTheme: IconThemeData(color: Colors.deepPurple[900]),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedItemColor: Colors.deepPurple[900],
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          color: Colors.black,
        ),
      ),
    );
