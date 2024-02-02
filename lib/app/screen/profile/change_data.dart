import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app.dart';

class ChangeData extends StatelessWidget {
  final String tittle;
  final int index;
  const ChangeData({super.key, required this.tittle, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (pc) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: double.infinity,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.mainPrimaryColor,
                    ),
                  ),
                  Text(
                    'Мой аккаунт',
                    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.mainPrimaryColor, fontSize: 16.sp),
                  ),
                  const Spacer(),
                  Text(
                    tittle,
                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.profileTextColor, fontSize: 17.sp),
                  ),
                  const Spacer(),
                  SizedBox(width: 80.w),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MyTextFormField(controller: pc.state.infoCtr, label: tittle),
                StyleConstants.formSpacer15H,
                PrimaryButton(
                    onPressed: () {
                      pc.onChangeData(index);
                      Get.offAll(() => DashBoardScreen());
                      Get.put(DashboardController()).state.bottomIndex.value = 1;
                    },
                    text: 'Сохранить')
              ],
            ),
          ),
        );
      },
    );
  }
}
