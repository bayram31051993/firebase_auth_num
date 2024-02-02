import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app.dart';

class ProfileController extends GetxController {
  final state = ProfileState();

  Future<File?> getImage(ImageSource source) async {
    final bool isGranted = await _requestPermission();
    if (!isGranted) {
      return null;
    }
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      state.profileImageFile = File(image.path);
      state.imagePathByte = await state.profileImageFile!.readAsBytes();
      String path = base64.encode(state.imagePathByte!);
      state.imagePathByte = base64.decode(path);
      debugPrint(path);
      state.boxPRofileImgPath.put(Boxes.imagePath, path);

      return state.profileImageFile;
    }
    return null;
  }

  Future<bool> _requestPermission() async {
    Map<Permission, PermissionStatus> result = await [Permission.storage, Permission.camera].request();
    if (result[Permission.camera] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  Future<void> openBox() async {
    state.boxPRofileImgPath = await Hive.openBox(Boxes.imagePath);

    String? path = state.boxPRofileImgPath.get(Boxes.imagePath);
    if (path != null) {
      state.imagePathByte = base64.decode(path);
    }
  }

  Future<void> init() async {
    state.isLoading(true);

    await openBox();

    state.isLoading(false);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> onChangeData(int index) async {
    late ProfileModel profile;
    var profileBox = Boxes.boxProfile.get(Boxes.profile);
    if (index == 1) {
      profile = ProfileModel()
        ..name = state.infoCtr.text
        ..surname = profileBox!.surname;
      await Boxes.boxProfile.putAt(0, profile);
    } else {
      profile = ProfileModel()
        ..name = profileBox!.surname
        ..surname = state.infoCtr.text;
      await Boxes.boxProfile.putAt(0, profile);
    }
  }
}
