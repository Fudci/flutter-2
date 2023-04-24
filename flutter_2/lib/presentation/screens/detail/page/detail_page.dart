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
      appBar: AppBar(
        title: Text('Detail Book'),
      ),
      body: GetBuilder<DetailController>(
        init: _controller,
        initState: (state) => _controller.getDetailBook(book.isbn13 ?? ''),
        builder: (context) {
          return _controller.detailBooks.value.image != null ? Padding(
            padding: const EdgeInsets.all(0),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Image.network(
                                '${_controller.detailBooks.value.image}',
                                width: 150,
                                height: 150,
                              )),
                          Expanded(
                              child: Text(
                            '${_controller.detailBooks.value.title}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Subtitle')),
                                  Expanded(
                                      child: Text(
                                          '${_controller.detailBooks.value.subtitle}'))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Authors')),
                                  Expanded(
                                      child: Text(
                                          '${_controller.detailBooks.value.authors}'))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Publisher')),
                                  Expanded(
                                      child: Text(
                                          '${_controller.detailBooks.value.publisher}'))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded( child: Text('Language')),
                                  Expanded(
                                 
                                      child: Text(
                                          '${_controller.detailBooks.value.language}'))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Pages')),
                                  Expanded(
                                      child: Text(
                                          '${_controller.detailBooks.value.pages}'))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Year')),
                                  Expanded(
                                      child: Text(
                                          '${_controller.detailBooks.value.year}'))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded(child: Text('Rating')),
                                  Expanded(
                                      child: Text(
                                          '${_controller.detailBooks.value.rating}'))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30,top: 20),
                            child: Expanded( 
                              
                              flex: 1,
                              child: Text('Desciption')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30,top: 20),
                            child: Expanded(
                              flex: 6,
                                child:
                                    Text('${_controller.detailBooks.value.desc}')),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ) : Center(child: CircularProgressIndicator()) ;
        },
      ),
    );
  }
}
// if (_controller.detailBooks.value.image != null)
//                     Image.network(
//                       '${_controller.detailBooks.value.image}',
//                       width: 500,
//                       height: 500,
                      
//                     ),
//                   Text('${_controller.detailBooks.value.title}'),
//                                   Text('${_controller.detailBooks.value.title}'),
//                   Text('${_controller.detailBooks.value.title}'),
//                   Text('${_controller.detailBooks.value.title}'),
//                   Text('${_controller.detailBooks.value.title}'),
//                   Text('${_controller.detailBooks.value.title}'),
          
//                   Text(book.isbn13 ?? 'No ISBN13'),
