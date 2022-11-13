class Car {
  final int id;
  final List<String> imgUrls;
  final String title;
  final String subtitle;
  final String rating;
  bool isFav;

  Car({
    required this.id,
    required this.imgUrls,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.isFav,
  });
}
