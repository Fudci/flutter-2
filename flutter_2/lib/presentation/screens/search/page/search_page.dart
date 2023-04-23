import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2/data/datasource/book_search_datasoure_dio.dart';
import 'package:flutter_2/data/model/book/book_model.dart';
import 'package:flutter_2/data/repository/book_search_repository_impl.dart';
import 'package:flutter_2/domain/use_case/get_book_search_use_case.dart';
import 'package:flutter_2/presentation/screens/detail/page/detail_page.dart';
import 'package:flutter_2/presentation/screens/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final String query;

  SearchPage({super.key, required this.query});

  final _controller = SearchController(
    GetBookSearchUseCase(
      BookSearchRepositoryImpl(
        BookRemoteSearchDataSource(Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder(
            init: _controller,
            initState: (state) => _controller.getBookSearch(query),
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                    itemCount: _controller.searchBooks.value.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final book = _controller.searchBooks.value[index];
                      return InkWell(
                        onTap: () => null,
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.title ?? 'No title',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text('null'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ))
                ],
              );
            }),
      ),
    );
  }
}
