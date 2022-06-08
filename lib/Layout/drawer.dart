import 'package:ashour/Modules/Login/login.dart';
import 'package:ashour/Shared/Local/cache_helper.dart';
import 'package:ashour/Shared/constants/app_strings.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //client settings
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Image(
                        image: AssetImage('assets/images/logo-.jpg'),
                        height: 100,
                      ),
                    ),
                    Divider(),
                    ConditionalBuilder(
                        condition: CacheHelper.getData(key: 'name') != null || CacheHelper.getData(key: 'email') != null,
                        builder: (context) => Column(
                          children: [
                            Text(CacheHelper.getData(key: 'name'),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              CacheHelper.getData(key: 'email'),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        fallback: (context) => SizedBox()),
                  ],
                ),
              ),
            ),
            //App settings
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.myAccount),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.myOrders),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        // cubit.changeLanguage(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.language),
                          Row(
                            children: [
                              Text(
                                AppStrings.language,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        // cubit.changeLanguage(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.darkMode),
                          Row(
                            children: [
                              Text(
                                AppStrings.light,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        // cubit.changeLanguage(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.settings),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //information Settings
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.information,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            // store settings
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.contactUs),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.oboutUs),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.termsAndConditions),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        CacheHelper.clearAll().then((value) {
                          navigateAndFinish(
                              context: context, widget: LoginScreen());
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppStrings.logout),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
