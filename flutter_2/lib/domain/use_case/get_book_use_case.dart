import 'package:flutter_2/data/model/book_response/book_response_model.dart';
import 'package:flutter_2/domain/repository/book_repository.dart';

class GetBookUseCase {
  final BookRepository _repository;

  const GetBookUseCase(this._repository);

  Future<BookResponse?> call() async => await _repository.getBook();
}