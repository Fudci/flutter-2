import 'package:flutter_2/data/model/book_detail_response/book_detail_response.dart';

abstract class BookDetailRepository {
  Future<BookDetailResponse?> getBookDetail();
}