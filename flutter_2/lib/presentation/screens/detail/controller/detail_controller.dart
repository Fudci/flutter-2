import 'package:flutter_2/data/model/book_detail_response/book_detail_response.dart';
import 'package:flutter_2/domain/use_case/get_book_detail_use_case.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final GetBookDetailUseCase _getBookDetailUseCase;

  DetailController(this._getBookDetailUseCase);

  Rx<BookDetailResponse> detailBooks = Rx(BookDetailResponse());

  void getDetailBook(String isbn13) async {
    final result = await _getBookDetailUseCase.call(isbn13);

    if (result != null) {
      detailBooks(result);
      update();
    }
  }
}
