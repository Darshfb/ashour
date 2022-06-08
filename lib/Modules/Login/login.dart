import 'package:ashour/Layout/ashour_layout.dart';
import 'package:ashour/Modules/Login/cubit/login_cubit.dart';
import 'package:ashour/Modules/Login/cubit/login_states.dart';
import 'package:ashour/Modules/Register/register.dart';
import 'package:ashour/Shared/Local/cache_helper.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/Shared/constants/app_strings.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is SuccessLoginState) {
            CacheHelper.saveData(
                    key: 'TOKEN', value: state.model.token.toString())
                .then((value) {
              showToast(
                  text: AppStrings.loginSuccess, state: ToastStates.SUCCESS);
              navigateAndFinish(context: context, widget: AshourLayout());
              print(value.toString());
            }).catchError((error) {
              print('error when save data $error');
            });
          } else if (state is ErrorLoginState) {
            showToast(text: AppStrings.errorSuccess, state: ToastStates.ERROR);
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25))),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 90,
                          child: Image(
                            image: AssetImage('assets/images/logo_app.jpg'),
                          ),
                        ),
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  AppStrings.login,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  AppStrings.login_text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                // email text form field
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppStrings.emailValidate;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: emailController,
                                  hintText: AppStrings.email_hint,
                                  prefixIcon: IconBroken.user,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                // password text form field
                                CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return AppStrings.passwordValidate;
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    hintText: AppStrings.password_hint,
                                    obscureText: cubit.isObscure,
                                    prefixIcon: IconBroken.password,
                                    suffixIcon: cubit.visibilityIcon,
                                    pressedSuffixIcon: () {
                                      cubit.loginChangeVisibility();
                                    }),
                                //Forget password
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CustomTextButton(
                                      onPressed: () {},
                                      text: AppStrings.forgotPassword),
                                ),
                                // Login Button
                                ConditionalBuilder(
                                    condition: state is! LoadingLoginState,
                                    builder: (context) => CustomButton(
                                        child: const Text(
                                          AppStrings.login,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            cubit.userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                          }
                                        },
                                        width: double.infinity,
                                        backgroundColor: Colors.teal,
                                        height: 50,
                                        textColor: Colors.white),
                                    fallback: (context) => const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.green),
                                        )),
                                const SizedBox(
                                  height: 10.0,
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('-OR-'),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                          },
                                          child: SvgPicture.asset('assets/images/google.svg',),),
                                        SizedBox(width: 10,),
                                        InkWell(
                                              onTap: (){
                                              },
                                              child: SvgPicture.asset('assets/images/facebook.svg')),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppStrings.noAccount),
                          CustomTextButton(
                              onPressed: () {
                                navigateTo(
                                    widget: RegisterScreen(), context: context);
                              },
                              text: AppStrings.registerNow),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
