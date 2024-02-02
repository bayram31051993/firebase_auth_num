import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/app/core/colors.dart';
import 'package:test_project/app/data/data.dart';
import 'package:test_project/app/screen/profile/change_data.dart';

class InfoWidget extends StatelessWidget {
  final ProfileModel profile;

  const InfoWidget({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: AppColors.profileTextSecondaryColor, blurRadius: 1.5),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: infoRow('Имя', profile.name, () => Get.to(() => const ChangeData(tittle: 'Ваше Имя', index: 1))),
          ),
          Divider(
            color: AppColors.profileTextSecondaryColor,
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: infoRow(
                'Фамилия', profile.surname, () => Get.to(() => const ChangeData(tittle: 'Ваша Фамилия', index: 2))),
          ),
        ],
      ),
    );
  }

  Row infoRow(tittle, desc, onClick) {
    return Row(
      children: [
        Text(
          tittle,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.textColor),
        ),
        const Spacer(),
        Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: AppColors.profileThirdTextColor,
          ),
        ),
        SizedBox(width: 10.w),
        InkWell(onTap: onClick, child: const Icon(Icons.arrow_forward_ios, color: AppColors.profileThirdTextColor))
      ],
    );
  }
}
