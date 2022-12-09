/*
 * Copyright (c) 2020 Matheus de Oliveira
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_trivia/core/theme/app_color_pallet.dart';
import 'package:number_trivia/modules/number_trivia/presentation/controllers/search_controller.dart';
import 'package:number_trivia/modules/number_trivia/presentation/widgets/background.dart';

import '../../../../core/theme/app_text.dart';
import '../../../../core/theme/app_theme.dart';

class SearchNumberTriviaScreen extends StatefulWidget {
  const SearchNumberTriviaScreen({Key? key}) : super(key: key);

  @override
  State<SearchNumberTriviaScreen> createState() =>
      _SearchNumberTriviaScreenState();
}

class _SearchNumberTriviaScreenState extends State<SearchNumberTriviaScreen> {
  final _controller = Get.find<SearchController>();
  final _formKey = GlobalKey<FormState>();
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Background(
        children: [
          Positioned(
              top: 191,
              right: 50,
              left: 50,
              child: AppText.headline(data: "Number\nTrivia")),
          Positioned(
            top: 413,
            left: 57,
            right: 57,
            child: SizedBox(
              width: 276,
              height: 60,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: GoogleFonts.kavoon(fontSize: 20),
                decoration: AppTheme.appInputDecoration,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty || int.parse(val) > 9999) {
                    return "";
                  }
                  return null;
                },
                onSaved: (val) {
                  searchText = val!;
                },
              ),
            ),
          ),
          Positioned(
            top: 482,
            left: 126,
            right: 126,
            child: GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _controller.search(searchText);
                }
              },
              child: Container(
                width: 138,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: AppText.body(data: "Search"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
