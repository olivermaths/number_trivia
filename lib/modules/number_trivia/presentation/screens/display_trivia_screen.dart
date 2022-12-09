/*
 * Copyright (c) 2020 Matheus de Oliveira
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_trivia/modules/number_trivia/presentation/widgets/background.dart';
import '../../../../core/theme/app_color_pallet.dart';
import '../../../../core/theme/app_text.dart';

class DisplayTrivia extends StatelessWidget {
  const DisplayTrivia({Key? key, required this.number, required this.text})
      : super(key: key);

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Background(
      children: [
        Positioned(
            top: 50,
            right: 56,
            child: Image.asset(
              "lib/assets/stars.png",
              width: 270,
            )),
        Positioned(
            top: 104,
            right: 20,
            left: 20,
            child: Transform.rotate(
              angle: pi / 30,
              child: AppText.headline(
                  data: "$number", fontsize: number > 7999 ? 120 : 128),
            )),
        Positioned(
            top: 326,
            right: 56,
            left: 56,
            child: AppText.body(data: text, fontsize: 20)),
        Positioned(
          top: 18,
          left: 9,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 69,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(
                Icons.arrow_left,
                size: 40,
              ),
            ),
          ),
        )
      ],
    );
  }
}
