import 'package:flutter/material.dart';
import 'package:logo/screens/add_or_update_car.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddOrUpdateCar(),
          ),
        );
      },
      child: const Icon(Icons.add_rounded),
    );
  }
}
