import 'package:flutter/material.dart';
import 'package:free_talk/providers/register/register_provider.dart';
import 'package:free_talk/views/routes.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/color.dart';
import '../../utils/widgets/custom_buttom.dart';
import '../../utils/widgets/custom_text_field.dart';

class RegisterViews extends StatelessWidget {
  const RegisterViews({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProviders>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.gulfBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 38,
              ),
              const Row(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              provider.currentPage==1?CustomTextField(controller: provider.firstNameController,label: 'First Name',) :CustomTextField(controller: provider.passwordController,label: 'Password',),
              const SizedBox(
                height: 20,
              ),
              provider.currentPage==1?CustomTextField(controller: provider.lastNameController,label: 'Last Name',) :CustomTextField(controller: provider.confirmPasswordController,label: 'confirm Password',),
              const SizedBox(
                height: 20,
              ),
              provider.currentPage==1?CustomTextField(controller: provider.lastNameController,label: 'Email',) :const SizedBox(height: 50,),
              const SizedBox(
                height: 70,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/free_talk_white.png",
                    ),
                    width: 120,
                    height: 120,
                  ),
                  Text(
                    "Free Talk",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      fontFamily: 'SendFlowers',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              CustomButton(
                text: provider.currentPage == 1 ? 'Next' : 'Register',
                height: 50,
                onPressed: () {
                  provider.currentPage ==1?
                  provider.nextPage():
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false,);
                },
                btnColor: AppColors.white,
                txtColor: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
