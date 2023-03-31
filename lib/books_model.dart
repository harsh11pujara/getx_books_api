class BookModel {
  int? bookId;
  String? name;
  String? author;
  int? votes;
  String? cover;
  String? url;

  BookModel({this.bookId, this.name, this.author, this.votes, this.cover, this.url});

  BookModel.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    name = json['name'];
    author = json['author'];
    votes = json['votes'];
    cover = json['cover'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['book_id'] = bookId;
    data['name'] = name;
    data['author'] = author;
    data['votes'] = votes;
    data['cover'] = cover;
    data['url'] = url;
    return data;
  }
}
