class Owner {
  late int id;
  late double rate;

  Owner();

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'] ?? 0;
  }
}
