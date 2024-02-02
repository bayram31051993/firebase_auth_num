import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/core.dart';

class StyleConstants {
  static SizedBox formSpacer8H = SizedBox(height: 8.h);
  static SizedBox formSpacer15H = SizedBox(height: 15.h);
  static SizedBox formSpacer10H = SizedBox(height: 10.h);
  static SizedBox formSpacer20H = SizedBox(height: 20.h);
  static SizedBox formSpacer30H = SizedBox(height: 30.h);

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.red),
  );
  static final OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: AppColors.primaryColor),
  );
  static final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: AppColors.secondaryBtnColor),
  );

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: AppColors.primaryColor),
  );

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: AppColors.secondaryBtnColor),
  );

  static final formTextStyle = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );
}
