import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:free_talk/models/register/registermodel.dart';
import 'package:free_talk/providers/register/register_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/color.dart';
import '../../utils/widgets/custom_buttom.dart';
import '../../utils/widgets/custom_text_field.dart';

class RegisterViews extends StatelessWidget {
  const RegisterViews({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProviders>(context);
    return WillPopScope(
        onWillPop: () async {
          if (provider.currentPage == 2) {
            provider.previousPage();
            return false; // Prevent exiting the screen
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Form(
            key: provider.formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 22, right: 20, bottom: 27),
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
                        'Register',
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
                  provider.currentPage == 1
                      ? CustomTextField(
                    obscureText: false,
                          controller: provider.userNameController,
                          label: 'username',
                          validator: (value){
                            if(value.isEmpty){
                              return 'please enter your username';
                            }

                          },
                  )
                      : CustomTextField(
                    obscureText: provider.isPasswordVisible,
                          controller: provider.passwordController, label: 'password',
                    icon: IconButton(onPressed: (){provider.passwordVisible();}, icon: Icon(provider.isPasswordVisible? Icons.visibility_off : Icons.visibility)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (!RegExp(provider.passwordPattern).hasMatch(value)) {
                        return 'Password must contain at least:\n'
                            '- One uppercase letter\n'
                            '- One lowercase letter\n'
                            '- One number\n'
                            '- One special character (@\$!%*?&)\n'
                            '- Minimum 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  provider.currentPage == 1
                      ? CustomTextField(
                    obscureText: false,
                          controller: provider.emailController,
                          label: 'email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(provider.emailPattern).hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  )
                      : CustomTextField(
                    obscureText: provider.isConfirmPasswordVisible,
                          controller: provider.confirmPasswordController,
                    icon: IconButton(onPressed: (){
                      provider.confirmPasswordVisible();
                    }, icon: Icon(provider.isConfirmPasswordVisible? Icons.visibility_off : Icons.visibility)),
                      label: 'confirm password',
                    validator: (value) {
                            if(value!= provider.passwordController.text){
                              return 'password not match';
                            }
                            return null;
                    },
                  ),
                  const Spacer(),
                  ConditionalBuilder(
                      condition: !provider.loading,
                      fallback: (context) => const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: AppColors.darkBlue,
                          ),
                        ],
                      ),
                      builder: (context) {
                      return CustomButton(
                          function: () {
                            if(provider.formKey.currentState!.validate()){
                                provider.currentPage == 1
                                    ? provider.nextPage()
                                    : provider.registerAccount(context);
                              }
                            },
                          text: provider.currentPage == 1 ? 'Next' : 'Register');
                    }
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
