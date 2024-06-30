class BookEntity {
  final String bookId;
  final String name;
  final String image;
  final List<String>? authors;
  final double? rate;
  final double? price;

  BookEntity({
    required this.bookId,
    required this.name,
    required this.image,
    required this.authors,
    required this.rate,
    required this.price,
  });
}
