import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 6)
class ProfileModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? surname;

  ProfileModel();
}
