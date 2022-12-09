/*
 * Copyright (c) 2020 Matheus de Oliveira
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
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
