import 'package:flutter/material.dart';
import 'package:logo/screens/add_or_update_car.dart';
import 'package:logo/utils/helpers.dart';

class CustomFloatingButton extends StatelessWidget with Helpers {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // pickImageSource(context: context);
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
