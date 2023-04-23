
import 'package:flutter_2/data/datasource/book_detail_datasource_dio.dart';
import 'package:flutter_2/data/model/book_detail_response/book_detail_response.dart';
import 'package:flutter_2/domain/repository/book_detail_repository.dart';

class BookDetailRepositoryImpl implements BookDetailRepository {

  final BookRemoteDetailDataSource _remoteDetailDataSource;

  const BookDetailRepositoryImpl(this._remoteDetailDataSource);

  @override
  Future<BookDetailResponse?> getBookDetail() async{
  return _remoteDetailDataSource.getBookDetail();
    // TODO: implement getBookDetail
  }


}