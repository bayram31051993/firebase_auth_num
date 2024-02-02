import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/app/app.dart';
import 'package:test_project/app/core/core.dart';
import 'package:test_project/app/screen/login/widget/circel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      init: LoginController(),
      builder: (lc) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: lc.state.pageIndex.value == Constants.phoneRegister
                ? const SizedBox()
                : IconButton(
                    onPressed: lc.onBackPress,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: lc.state.pageIndex.value == Constants.profileEdit
                          ? AppColors.primaryColor
                          : AppColors.textColor,
                    ),
                  ),
          ),
          body: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CircleWidget(
                  positionIndex: Constants.phoneRegister,
                  currentPage: lc.state.pageIndex,
                  text: '1',
                  isChecked: lc.state.isCheckedPhone.value,
                ),
                CircleWidget(
                  positionIndex: Constants.otpConfirm,
                  currentPage: lc.state.pageIndex,
                  text: '2',
                  isChecked: lc.state.isCheckedOtp.value,
                ),
                CircleWidget(
                  positionIndex: Constants.profileEdit,
                  currentPage: lc.state.pageIndex,
                  text: '3',
                  isChecked: lc.state.isCheckedProfile.value,
                ),
              ]),
              Expanded(
                child: SizedBox(
                  height: 0.8.sh,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    reverse: true,
                    controller: lc.state.pageController,
                    itemCount: lc.state.pages.length,
                    itemBuilder: (context, index) {
                      return lc.state.pages[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
