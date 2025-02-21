import 'package:flutter/material.dart';
import 'package:free_talk/providers/home/home_provider.dart';
import 'package:free_talk/utils/colors/color.dart';
import 'package:free_talk/views/account/widgets/about_the_app_section.dart';
import 'package:free_talk/views/account/widgets/account_section.dart';
import 'package:free_talk/views/account/widgets/help_section.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: provider.accountScrollController,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const ShapeDecoration(
                  shape: OvalBorder(), color: AppColors.gray),
            ),
            const SizedBox(
              height: 20,
            ),
            const AccountSection(),
            const SizedBox(
              height: 20,
            ),
            const HelpSection(),
            const SizedBox(
              height: 20,
            ),
            const AboutTheAppSection(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.logout(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: AppColors.tealBlue, width: 2)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: AppColors.tealBlue,
                            size: 32,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'logout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.tealBlue),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
