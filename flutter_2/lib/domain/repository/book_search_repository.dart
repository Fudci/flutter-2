import 'package:flutter_2/data/model/book_search_response/book_search_response.dart';

abstract class BookSearchRepository {
  Future<BookSearchResponse?>getBookSearch(String isbn13);
}