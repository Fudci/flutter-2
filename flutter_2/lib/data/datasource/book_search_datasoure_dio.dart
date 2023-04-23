import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_2/constants/constants.dart';
import 'package:flutter_2/data/model/book_search_response/book_search_response.dart';

class BookRemoteSearchDataSource  {
  final Dio _client;

  const BookRemoteSearchDataSource(this._client);

  Future<BookSearchResponse?> getBookSearch(String isbn13) async {
    log('hasill,${isbn13}');
    try {
      final url = Constants.searchBookRul + isbn13 ;

      final result = await _client.get(url);

      if (result.statusCode == 200) {
        print('${result.data}, resulttt ');
        return BookSearchResponse.fromJson(result.data);
      }

      return null;
    } catch (error, stacktrace) {
      log('Error on GETDETAIL BOOK $error', stackTrace: stacktrace);
      return null;
    }
  }
}