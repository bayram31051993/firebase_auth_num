// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_project/app/app.dart';

class LoginController extends GetxController {
  final state = LoginState();

  void onNumberComplete(int numberLength) {
    if (numberLength < 18) {
      state.isFieldEmpty(false);
    } else {
      state.isFieldEmpty(true);
    }
  }

  void nextForm(position) {
    state.pageIndex.value = position;

    state.pageController.jumpToPage(position);
    if (position == Constants.phoneRegister) {
      state.isCheckedOtp(false);
      state.isCheckedPhone(false);
    } else if (position == Constants.otpConfirm) {
      state.isCheckedPhone(true);
      state.isCheckedOtp(false);
    } else if (position == Constants.profileEdit) {
      state.isCheckedPhone(true);
      state.isCheckedOtp(true);
    }
  }

  void onBackPress() {
    state.pageIndex.value--;
    state.pageController.jumpToPage(state.pageIndex.value);
    if (state.pageIndex.value == Constants.phoneRegister) {
      state.duration(60);
      state.isCheckedOtp(false);
      state.isCheckedPhone(false);
    } else if (state.pageIndex.value == Constants.otpConfirm) {
      state.isCheckedPhone(true);
      state.isCheckedOtp(false);
    } else if (state.pageIndex.value == Constants.profileEdit) {
      state.duration(0);
      state.isCheckedPhone(true);
      state.isCheckedOtp(true);
    }
  }

  Future<void> onSubmit(String text) async {
    debugPrint(state.verifyId);
    try {
      PhoneAuthCredential authCredential = PhoneAuthProvider.credential(verificationId: state.verifyId, smsCode: text);

      User? user = (await state.firebaseAuth.signInWithCredential(authCredential)).user;

      // Boxes.boxString.put(Boxes.usrId, user.uid);
      debugPrint(user!.uid);

      nextForm(2);
      state.duration(0);
    } catch (e) {
      showSnack('error', '$e', SnackType.error);
      debugPrint('$e');
      return;
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    state.timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (state.duration.value == 0) {
          timer.cancel();
        } else {
          state.duration.value--;
        }
      },
    );
  }

  void restartTimer() {
    // set timer
    state.duration.value = 30;

    // start timer
    startTimer();
  }

  Future<void> signIn() async {
    try {
      state.isLoading(true);
      await state.firebaseAuth.verifyPhoneNumber(
          phoneNumber: state.phoneCtrl.text.trim(),
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
            await state.firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            state.isLoading(false);
            showSnack('error', '$error', SnackType.error);
            debugPrint('$error');
          },
          codeSent: (verifyId, resendToken) {
            startTimer();
            nextForm(1);
            state.isLoading(false);
            state.verifyId = verifyId;
            state.resendTokenId = resendToken!;
          },
          codeAutoRetrievalTimeout: (verifyId) {});
    } catch (e) {
      showSnack('error', '$e');
      return;
    }
  }

  Future<void> onSaveUser() async {
    if (!state.profileForm.currentState!.validate()) return;
    ProfileModel profileModel = ProfileModel()
      ..name = state.nameCtrl.text
      ..surname = state.surnameCtrl.text;

    Boxes.boxProfile.delete(Boxes.profile);

    await Boxes.boxProfile.put(Boxes.profile, profileModel);

    if (Boxes.boxProfile.values.isNotEmpty) {
      showSnack('Внимание', 'Вы успешно зарегистрировались');
      Get.offAll(() => DashBoardScreen());
    }
  }
}
