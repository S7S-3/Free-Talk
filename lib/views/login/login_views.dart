import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:free_talk/models/login/loginmodel.dart';
import 'package:free_talk/utils/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:free_talk/utils/colors/color.dart';
import 'package:free_talk/providers/login/login_provider.dart';

import '../../utils/widgets/custom_buttom.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: provider.formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 22, right: 20, bottom: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 48),
                  child: Image(
                    image: AssetImage('assets/images/free_talk_blue.png'),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            AppColors.gulfBlue,
                            AppColors.darkBlue,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(const Rect.fromLTWH(0, 0, 200, 50)),
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              CustomTextField(
                  controller: provider.userNameController, label: 'username',obscureText: false,),
              const SizedBox(
                height: 28,
              ),
              CustomTextField(
                  controller: provider.passwordController, label: 'password',icon: IconButton(onPressed: (){provider.passwordVisible();}, icon: Icon(provider.isPasswordVisible? Icons.visibility_off : Icons.visibility)),obscureText: provider.isPasswordVisible,),
              const SizedBox(
                height: 65,
              ),
              const Spacer(),
              ConditionalBuilder(
                fallback: (context) => const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: AppColors.darkBlue,)
                  ],
                ),
                condition: !provider.loading,
                builder: (context) {
                  return CustomButton(
                      function: () {
                        provider.loginAccount(context);
                      },
                      text: 'Login');
                }
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'If you don’t have an account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF03045E),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.navToRegister(context);
                      },
                      child: const Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF03045E),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
