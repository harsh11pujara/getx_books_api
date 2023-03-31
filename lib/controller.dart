import 'package:books_app_getx/books_model.dart';
import 'package:books_app_getx/services.dart';
import 'package:get/get.dart';

class BooksController extends GetxController {
  @override
  void onInit() {
    getBookData();
    super.onInit();
  }

  List booksData = [].obs;

  getBookData() async {
    booksData = await BooksServices().fetchApiData();
    update();
  }
}
