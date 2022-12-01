class City {
  late int id;
  late String name;

  City();

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
