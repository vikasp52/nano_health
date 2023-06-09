import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/features/login/presentation/screens/widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const LogoTitle(),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ListView(
                children: [
                  TextFormField(
                    controller: _emailController,
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
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Continue'),
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
          )
        ],
      ),
    );
  }
}
