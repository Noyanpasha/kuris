import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kur_iss/loggin_page.dart';
import 'package:kur_iss/main_screen.dart';
import 'first_page.dart';
import 'kayit_olma.dart';
import 'loggin_page.dart';
import 'main_screen.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', //  Ana sayfa, başlangıç rotası
      routes: {
        '/': (context) => FirstPage(),
        '/sayfa2': (context) => LoginPage(),
        '/sayfa3': (context) => MainScreen(),
        '/sayfa4': (context)=> LoginUp(),
      },

    ),
  );
}