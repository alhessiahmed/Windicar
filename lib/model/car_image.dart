// {
//   id: 1,
//   image_url: 'https://car.windicar.com/images/cars/w9iL5rZic501671041499f9O9vwY7dw.jpg',
//   car_id: 31,
//   created_at: '2022-12-14T18:11:39.000000Z',
//   updated_at: '2022-12-14T18:11:39.000000Z'
// }

class CarImage {
  late int id;
  late String imageUrl;
  late int carId;
  late String createdAt;
  late String updatedAt;

  CarImage();

  CarImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    carId = json['car_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
