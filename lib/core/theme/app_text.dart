/*
 * Copyright (c) 2020 Matheus de Oliveira
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color_pallet.dart';

abstract class AppText {
  static Text headline({String data = "default", double fontsize = 65}) => Text(
        data,
        textAlign: TextAlign.center,
        style: GoogleFonts.kavoon(
            color: AppColors.primaryColor, fontSize: fontsize),
      );

  static Text body(
          {String data = "default",
          double fontsize = 16,
          Color textColor = AppColors.defaultWhite}) =>
      Text(
        data,
        textAlign: TextAlign.center,
        style: GoogleFonts.kavoon(color: textColor, fontSize: fontsize),
      );
}
