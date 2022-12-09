class Owner {
  late int id;
  String? name;
  double? rate;
  String? imageUrl;
  String? phone;

  Owner();

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? 'User';
    rate = json['rate'] ?? 0;
    imageUrl = json['image_url'] ?? '';
    phone = json['phone'] ?? '00970592464423';
  }
}
