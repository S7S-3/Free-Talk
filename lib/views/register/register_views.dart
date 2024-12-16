import 'package:flutter/material.dart';
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
      onWillPop: ()async{
        if (provider.currentPage == 2) {
          provider.previousPage();
          return false; // Prevent exiting the screen
        }
        return true;
      },
      child:  Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 22,right: 20,bottom: 27),
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
              const SizedBox(height: 28,),
              provider.currentPage==1?CustomTextField(controller: provider.emailController,label: 'first name'):CustomTextField(controller: provider.emailController,label: 'email'),
              const SizedBox(height: 28,),
              provider.currentPage==1?CustomTextField(controller: provider.passwordController,label: 'last name'):CustomTextField(controller: provider.emailController,label: 'email'),
              const SizedBox(height: 28,),
              provider.currentPage==1? CustomTextField(controller: provider.emailController,label: 'email'):const SizedBox(height: 55,),
              const SizedBox(height: 20,),
              const Spacer(),
              CustomButton(function: (){
                provider.currentPage==1? provider.nextPage():provider.navToLogin(context);
              }, text: provider.currentPage==1?'Next':'Register'),
            ],
          ),
        ),
      ),
    )
    );
  }
}
