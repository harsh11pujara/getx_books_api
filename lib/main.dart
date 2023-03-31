import 'package:books_app_getx/books_model.dart';
import 'package:books_app_getx/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController searchController = TextEditingController();
  String searchValue = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(),
              child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.yellow[100],
                      label: const Text("Search Books..."),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(style: BorderStyle.none, color: Colors.transparent))))),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: GetBuilder<BooksController>(
                init: BooksController(),
                builder: (controller) {
                  List data = controller.booksData;
                  List showList = [];

                  if (data.isNotEmpty) {
                    for (var i in data) {
                      BookModel book = i;
                      if (book.name.toString().toLowerCase().contains(searchController.text.toLowerCase())) {
                        showList.add(book);
                      }
                    }
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: showList.length,
                        itemBuilder: (context, index) {
                          BookModel book = showList[index];
                          return Container(

                              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                              child: Row(
                                children: [
                                  Image.network(book.cover.toString(), width: 65),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width : 230,
                                        child: Text(
                                          book.name.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          softWrap: true,
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width : 230,
                                        child: Text(
                                          '- ${book.author.toString()}',
                                          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ));
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
