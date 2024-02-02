import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import 'model/profile/profile.dart';

class Boxes {
  static const imagePath = 'imagePath';

  // Hive box names
  static const String string = 'boxString';
  static const String integer = 'boxInt';
  static const String boolean = 'boxBoolean';
  static const String usrId = 'usrId';
  static const String profile = 'profile';

  static late Box<String> boxString;
  static late Box<int> boxInt;
  static late Box<bool> boxBoolean;

  static late Box<ProfileModel> boxProfile;
  static late Box<File> boxFiles;

  // Register all adapters & Initialize all boxes
  static Future<void> initBoxes() async {
    // NOTE: steps are important
    // 1. Init Hive
    await Hive.initFlutter();

    // 2. Register hive adapters
    registerHiveAdapters();

    // 3. open boxes. (These boxes needs to be opened at the beginning of the app)
    boxString = await Hive.openBox(string);
    boxInt = await Hive.openBox(integer);
    boxBoolean = await Hive.openBox(boolean);
    boxProfile = await Hive.openBox(profile);
  }

  // register hive adapter
  static void registerHiveAdapters() {
    Hive.registerAdapter<ProfileModel>(ProfileModelAdapter());
  }

  // Close all open hive boxes
  static void close() => Hive.close();

  // Autocomplete
}
