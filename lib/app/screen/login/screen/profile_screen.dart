import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/app/app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (lc) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Form(
            key: lc.state.profileForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'Имя',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                StyleConstants.formSpacer10H,
                MyTextFormField(
                  controller: lc.state.nameCtrl,
                  label: 'Софья',
                  hintText: 'Софья',
                ),
                StyleConstants.formSpacer20H,
                Text(
                  'Фамилия',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                StyleConstants.formSpacer10H,
                MyTextFormField(
                  controller: lc.state.surnameCtrl,
                  label: 'Аполло',
                  hintText: 'Аполло',
                ),
                StyleConstants.formSpacer20H,
                PrimaryButton(onPressed: () => lc.onSaveUser(), text: 'Сохранить')
              ],
            ),
          ),
        );
      },
    );
  }
}
