import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_2/constants/constants.dart';
import 'package:flutter_2/data/model/book_detail_response/book_detail_response.dart';

class BookRemoteDetailDataSource  {
  final Dio _client;

  const BookRemoteDetailDataSource(this._client);

  Future<BookDetailResponse?> getBookDetail(String isbn13) async {
    log('hasill,${isbn13}');
    try {
      final url = Constants.detailBookUrl + isbn13 ;

      final result = await _client.get(url);

      if (result.statusCode == 200) {
        print('${result.data}, resulttt ');
        return BookDetailResponse.fromJson(result.data);
      }

      return null;
    } catch (error, stacktrace) {
      log('Error on GETDETAIL BOOK $error', stackTrace: stacktrace);
      return null;
    }
  }
}