class BookEntity {
  final String bookId;
  final String name;
  final String image;
  final List<String>? authors;
  final num? rate;
  final num? price;

  BookEntity({
    required this.bookId,
    required this.name,
    required this.image,
    required this.authors,
    required this.rate,
    required this.price,
  });
}
