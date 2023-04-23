import 'package:flutter_2/data/model/book_search_response/book_search_response.dart';
import 'package:flutter_2/domain/repository/book_detail_repository.dart';

import '../repository/book_search_repository.dart';

class GetBookSearchUseCase {
  final BookSearchRepository _bookSearchRepository;

  const GetBookSearchUseCase(this._bookSearchRepository);

  Future<BookSearchResponse?> call(String isbn13) async => await _bookSearchRepository.getBookSearch(isbn13);
}
