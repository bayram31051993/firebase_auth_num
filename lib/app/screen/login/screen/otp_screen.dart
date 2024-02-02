import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_project/app/app.dart';

import '../../../core/colors.dart';
import '../../../core/style.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                'Подтверждение',
                style: TextStyle(
                  fontSize: 30.sp,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              StyleConstants.formSpacer30H,
              SizedBox(
                width: 0.8.sw,
                child: Text(
                  'Введите код, который мы отправили в SMS на ${lc.state.phoneCtrl.text}',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              StyleConstants.formSpacer30H,
              SizedBox(
                width: 0.8.sw,
                child: PinCodeTextField(
                    autoDisposeControllers: false,
                    controller: lc.state.otpCtrl,
                    appContext: context,
                    length: 6,
                    onChanged: (code) {},
                    textStyle: const TextStyle(color: AppColors.secondaryTextColor),
                    cursorColor: AppColors.secondaryTextColor,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme.defaults(
                      inactiveColor: AppColors.secondaryBtnColor,
                      activeColor: AppColors.primaryColor,
                      errorBorderColor: Colors.red,
                      fieldWidth: 0.10.sw,
                      fieldOuterPadding: const EdgeInsets.all(2),
                      shape: PinCodeFieldShape.underline,
                      inactiveFillColor: AppColors.secondaryBtnColor,
                      activeFillColor: AppColors.secondaryBtnColor,
                    ),
                    onCompleted: (verCode) => lc.onSubmit(verCode)),
              ),
              StyleConstants.formSpacer10H,
              SizedBox(
                width: 0.8.sw,
                child: InkWell(
                  onTap: () {
                    if (lc.state.duration.value != 0) return;
                    lc.state.otpCtrl.clear();
                    lc.signIn();
                  },
                  child: Text(
                    lc.state.duration.value == 0
                        ? 'Отправить код еще раз'
                        : '${lc.state.duration} сек до повтора отправки кода',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: lc.state.duration.value == 0 ? AppColors.primaryColor : AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
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
