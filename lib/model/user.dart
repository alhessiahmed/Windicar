class User {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String password;
  late String callCount;
  late String rate;
  late String imageUrl;
  late String cityId;
  late String createdAt;
  late String updatedAt;
  late String token;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    // emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    // password = json['password'];
    // verificationCode = json['verification_code'];
    callCount = json['call-count'];
    rate = json['rate'];
    imageUrl = json['image_url'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }
}
