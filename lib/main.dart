import 'package:anime_api1/ui/GetRandomQuote.dart';
import 'package:anime_api1/ui/GetRandomQuoteByCharacter.dart';
import 'package:anime_api1/ui/GetRandomQuoteByTitle.dart';
import 'package:anime_api1/ui/GetTenRandomQuotes.dart';
import 'package:anime_api1/ui/GetTenRandomQuotesByCharacter.dart';
import 'package:anime_api1/ui/GetTenRandomQuotesByTitle.dart';
import 'package:anime_api1/ui/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    home: const ApiScreen(),
    routes: {
      "GetTenRandomQuotes": (context) => const GetTenRandomQuotes(),
      "GetTenRandomQuotesByTitle": (context) => const GetTenRandomQuotesByTitle(),
      "GetTenRandomQuoteByCharacter": (context) => const GetTenRandomQuoteByCharacter(),
      "GetRandomQuote": (context) => const GetRandomQuote(),
      "GetRandomQuoteByTitle": (context) => const GetRandomQuoteByTitle(),
      "GetRandomQuoteByCharacter": (context) => const GetRandomQuoteByCharacter(),
    }
    );
  }
}