import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_project/app/core/core.dart';

class CircleWidget extends StatelessWidget {
  final int positionIndex;
  final RxInt currentPage;
  final String text;
  final bool isChecked;
  const CircleWidget({
    super.key,
    required this.positionIndex,
    required this.currentPage,
    required this.text,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      height: 35.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isChecked ? AppColors.successColor : Colors.transparent),
          color: isChecked
              ? Colors.white
              : positionIndex == currentPage.value
                  ? AppColors.primaryColor
                  : AppColors.dotsColor),
      child: isChecked
          ? const Icon(
              Icons.check,
              color: AppColors.successColor,
              size: 25,
            )
          : Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp, color: AppColors.textColor),
            ),
    );
  }
}
