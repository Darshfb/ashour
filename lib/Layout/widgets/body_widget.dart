import 'package:ashour/Shared/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyWidget extends StatelessWidget {
  BodyWidget({Key? key, required this.cubit}) : super(key: key);
  final cubit;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return cubit.screens[cubit.currentIndex];
        } else {
          return buildOfflineWidget();
        }
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildOfflineWidget() {
    return Center(
      child: Container(
        height: 320,
        width: 320,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              AppStrings.internetCheck,
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              'assets/images/check_internet.svg',
              height: 150,
              width: 150,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
