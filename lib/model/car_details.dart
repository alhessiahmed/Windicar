enum FuelType {
  gasoil,
  essence,
}

enum CarType {
  auto,
  manuel,
}

class CarDetails {
  final String city;
  final String name;
  final double price;
  final String description;
  FuelType fuelType;
  CarType carType;

  CarDetails({
    required this.city,
    required this.name,
    required this.price,
    required this.description,
    required this.fuelType,
    required this.carType,
  });
}
