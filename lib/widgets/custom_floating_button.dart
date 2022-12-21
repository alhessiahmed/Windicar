import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/pref/shared_pref_controller.dart';
import 'package:logo/screens/add_or_update_car.dart';
import 'package:logo/utils/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFloatingButton extends StatelessWidget with Helpers {
  const CustomFloatingButton({
    required this.isHome,
    Key? key,
  }) : super(key: key);
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return isHome
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 32.r),
                child: FloatingActionButton(
                  heroTag: 'supportFloatingActionButton',
                  onPressed: () {
                    callTelephone(context: context, number: '+212648950766');
                  },
                  child: const Icon(Icons.support_agent_rounded),
                ),
              ),
              FloatingActionButton(
                heroTag: 'homeFloatingActionButton',
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
              ),
            ],
          )
        : FloatingActionButton(
            heroTag: 'profileFloatingActionButton',
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

  void callTelephone({
    required BuildContext context,
    required String number,
  }) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Can't make phone calls")));
    }
  }
}
