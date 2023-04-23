import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/data/datasource/book_detail_datasource_dio.dart';
import 'package:flutter_2/data/model/book/book_model.dart';
import 'package:flutter_2/data/repository/book_detail_repository_impl.dart';
import 'package:flutter_2/domain/use_case/get_book_detail_use_case.dart';
import 'package:flutter_2/presentation/screens/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  DetailPage({super.key, required this.book});

  final _controller = DetailController(
    GetBookDetailUseCase(
      BookDetailRepositoryImpl(
        BookRemoteDetailDataSource(Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<DetailController>(
        init: _controller,
        initState: (state) => _controller.getDetailBook(book.isbn13 ?? ''),
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_controller.detailBooks.value.title},hasill'),
                Text(book.isbn13 ?? 'No ISBN13'),
              ],
            ),
          );
        },
      ),
    );
  }
}
