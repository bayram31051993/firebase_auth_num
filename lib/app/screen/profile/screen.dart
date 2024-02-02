import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/app/app.dart';
import 'package:test_project/app/screen/profile/widget/iamge_widget.dart';
import 'package:test_project/app/screen/profile/widget/info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
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
                        Get.put(DashboardController()).state.bottomIndex.value = 0;
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
                      'Аккаунт',
                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.profileTextColor, fontSize: 17.sp),
                    ),
                    const Spacer(),
                    SizedBox(width: 80.w),
                  ],
                ),
              ),
            ),
            body: pc.state.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        StyleConstants.formSpacer15H,
                        const ImageWidget(editable: true),
                        StyleConstants.formSpacer15H,
                        Text(
                          'apollo@gmail.com',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12.sp,
                          ),
                        ),
                        StyleConstants.formSpacer15H,
                        ValueListenableBuilder(
                          valueListenable: Boxes.boxProfile.listenable(),
                          builder: (context, profileBox, widget) {
                            return InfoWidget(profile: profileBox.values.first);
                          },
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}
