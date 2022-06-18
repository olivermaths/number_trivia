import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'modules/number_trivia/presentation/bindings/search_number_trivia_bindings.dart';
import 'modules/number_trivia/presentation/screens/search_number_trivia_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: const SearchNumberTriviaScreen(),
    initialBinding: SearchNumberTriviaBindings(),
  ));
}
