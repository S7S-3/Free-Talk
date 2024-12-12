import 'package:flutter/material.dart';
import 'package:free_talk/views/routes.dart';
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
      backgroundColor: AppColors.gulfBlue,
      resizeToAvoidBottomInset: true, // Ensures layout adjusts for keyboard
      body: Column(
        children: [
          // Top section with logo and title
          const Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/white_logo.png'),
                  height: 80,
                ),
                Text(
                  "Free Talk",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    fontFamily: 'SendFlowers',
                  ),
                ),
              ],
            ),
          ),
          // Bottom section with form
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Username field
                      TextFormField(
                        controller: provider.emailController,
                        cursorColor: AppColors.gulfBlue,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gulfBlue,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.gulfBlue),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.gulfBlue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Password field
                      StatefulBuilder(
                        builder: (context, setState) {
                          return TextFormField(
                            obscureText: !provider.isPasswordVisible,
                            controller: provider.passwordController,
                            cursorColor: AppColors.gulfBlue,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gulfBlue,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  provider.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.gulfBlue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    provider.isPasswordVisible =
                                        !provider.isPasswordVisible;
                                  });
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: AppColors.gulfBlue),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: AppColors.gulfBlue),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: 'Login',
                        height: 50,
                        txtColor: AppColors.white,
                        onPressed: () async {
                          provider.login(provider.emailController.text,
                              provider.passwordController.text,context);
                        },
                        btnColor: AppColors.gulfBlue,
                      ),
                       Row(
                        children: [
                          const Text("If you don’t have an account",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              )),
                          const SizedBox(
                            width: 9,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, AppRoutes.register);
                            },
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
