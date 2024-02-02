import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/app/app.dart';
import 'package:test_project/app/core/core.dart';
import 'package:test_project/app/global/primary_button.dart';
import 'package:test_project/app/global/text_field.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
        init: LoginController(),
        builder: (lc) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              children: [
                Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                StyleConstants.formSpacer30H,
                SizedBox(
                  width: 0.5.sw,
                  child: Text(
                    'Введите номер телефона для регистрации',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                StyleConstants.formSpacer30H,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Номер телефона',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                StyleConstants.formSpacer10H,
                MyTextFormField(
                  controller: lc.state.phoneCtrl,
                  label: '+7',
                  hintText: '+7',
                  inputType: TextInputType.phone,
                  inputFormatters: [maskPhone],
                  onChangeCallback: (value) => lc.onNumberComplete(value.length),
                ),
                SizedBox(height: 50.h),
                lc.state.isLoading.value
                    ? const CircularProgressIndicator()
                    : PrimaryButton(
                        onPressed: () {
                          if (!lc.state.isFieldEmpty.value) return;

                          lc.signIn();
                        },
                        text: 'Отправить смс-код',
                        color: lc.state.isFieldEmpty.value ? AppColors.primaryColor : AppColors.secondaryBtnColor,
                        shadowColor: Colors.transparent,
                      ),
                StyleConstants.formSpacer10H,
                RichText(
                  text: TextSpan(
                      text: 'Нажимая на данную кнопку, вы даете согласие на обработку',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: ' персональных данных',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        });
  }
}
