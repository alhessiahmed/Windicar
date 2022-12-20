import 'package:flutter/material.dart';
import 'package:logo/pref/shared_pref_controller.dart';
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
        SharedPrefController().loggedIn
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddOrUpdateCar(),
                ),
              )
            : Navigator.pushNamed(context, '/login_screen');
      },
      child: const Icon(Icons.add_rounded),
    );
  }
}
