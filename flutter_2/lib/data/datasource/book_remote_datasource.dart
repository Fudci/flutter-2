import 'package:flutter_2/data/model/book_response/book_response_model.dart';

abstract class BookRemoteDatasource {
  Future<BookResponse?> getBook();
}