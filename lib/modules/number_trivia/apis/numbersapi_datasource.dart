/*
 * Copyright (c) 2020 Matheus de Oliveira
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:number_trivia/modules/number_trivia/data/datasources/search_datasource.dart';
import 'package:number_trivia/modules/number_trivia/data/models/search_number_trivia_result_model.dart';

class NumbersApiDataSource implements SearchDatasource {
  final http.Client httpClient = http.Client();
  NumbersApiDataSource();
  @override
  Future<SearchNumberTriviaModel> getSearch(String searchText) async {
    final response = await httpClient
        .get(Uri.parse("http://numbersapi.com/${searchText.trim()}?json"));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = SearchNumberTriviaModel.fromJson(json);
      return result;
    } else {
      throw Exception();
    }
  }
}
