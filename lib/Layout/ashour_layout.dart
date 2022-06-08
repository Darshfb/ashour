import 'package:ashour/Layout/cubit/category_cubit.dart';
import 'package:ashour/Layout/cubit/category_states.dart';
import 'package:ashour/Layout/drawer.dart';
import 'package:ashour/Layout/widgets/body_widget.dart';
import 'package:ashour/Shared/constants/app_strings.dart';
import 'package:ashour/Shared/constant/const.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AshourLayout extends StatelessWidget {
  AshourLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AshourCubit, AshourStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AshourCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Hi'),
                SizedBox(
                  width: 5.0,
                ),
                Text('Name!'),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    print(userName);
                  }, icon: const Icon(IconBroken.notification)),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width / 1.3,
            child: AppDrawer(),
          ),
          body: BodyWidget(cubit: cubit),
          //cubit.screens[cubit.currentIndex]
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.bottomNavBar(value);
              },
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.home), label: AppStrings.home),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.category), label: AppStrings.category),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.opencart), label: AppStrings.cart),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.profile), label: AppStrings.profile),
              ]),
        );
      },
    );
  }
}
