import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/core/routing/routing.dart';
import 'package:nano_health/core/utils/utils.dart';
import 'package:nano_health/features/login/presentation/cubit/login_cubit.dart';
import 'package:nano_health/features/login/presentation/screens/widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const LogoTitle()),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) => CustomValidation.emptyValidation(
                          value,
                          'Please enter username',
                        ),
                        decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: CustomTypography.textFieldLabel,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) => CustomValidation.emptyValidation(
                          value,
                          'Please enter password',
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style: CustomTypography.textFieldLabel,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            error: (message) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(
                                success: false,
                                message: message,
                              ),
                            ),
                            validated: () => RouteGenerator.pushReplacement(
                              routeName: RouteGenerator.productRoute,
                            ),
                            orElse: () {},
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            orElse: () => ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  cubit.authorizedUser(
                                    userName: _usernameController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );
                                }
                              },
                              child: const Text('Continue'),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Text(
                          'NEED HELP?',
                          style: CustomTypography.subTitle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
