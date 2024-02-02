import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../app.dart';

class ProfileState {
  RxBool isLoading = false.obs;

  late Box boxPRofileImgPath;

  File? profileImageFile;
  RxString imagePath = ''.obs;
  Uint8List? imagePathByte;

  Rxn<ProfileModel> profileModel = Rxn<ProfileModel>();

  TextEditingController infoCtr = TextEditingController();
}
