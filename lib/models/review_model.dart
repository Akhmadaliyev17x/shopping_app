class Review{
  final String name;
  final String imageUrl;
  final String dateTime;
  final String title;
  final String comment;
  final int rate;

  const Review({
    required this.name,
    required this.imageUrl,
    required this.dateTime,
    required this.title,
    required this.comment,
    required this.rate,
  });

  @override
  String toString() {
    return 'Review{name: $name, imageUrl: $imageUrl, dateTime: $dateTime, title: $title, comment: $comment, rate: $rate}\n';
  }
}