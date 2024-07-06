class BookEntity {
  final String bookId;
  final String name;
  final String image;
  final String category;
  final List<String>? authors;
  final double? rate;
  final double? price;
  final String saleability;
  final String? previewLink;
  final String? canonicalVolumeLink;

  BookEntity({
    required this.category,
    required this.canonicalVolumeLink,
    required this.previewLink,
    required this.saleability,
    required this.bookId,
    required this.name,
    required this.image,
    required this.authors,
    required this.rate,
    required this.price,
  });
}
