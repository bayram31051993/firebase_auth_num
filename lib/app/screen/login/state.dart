import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/otp_screen.dart';
import 'screen/phone_screen.dart';
import 'screen/profile_screen.dart';

class LoginState {
  RxBool isLoading = false.obs;

  RxInt pageIndex = 0.obs;

  RxBool isCheckedPhone = false.obs;
  RxBool isCheckedOtp = false.obs;
  RxBool isCheckedProfile = false.obs;

  RxBool isFieldEmpty = false.obs;

  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController otpCtrl = TextEditingController();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController surnameCtrl = TextEditingController();

  PageController pageController = PageController();

  GlobalKey<FormState> profileForm = GlobalKey<FormState>();

  List<Widget> pages = [
    const PhoneScreen(),
    const OtpScreen(),
    const ProfileScreen(),
  ];

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Timer? timer;
  final duration = 60.obs;

  String verifyId = '';
  int resendTokenId = 0;
}
