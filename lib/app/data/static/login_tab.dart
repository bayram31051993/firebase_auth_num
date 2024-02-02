import 'package:test_project/app/data/model/model.dart';

class StaticLoginTab {
  static List<LoginTabModel> tabList = [
    LoginTabModel(pageNumber: '1', isChecked: false),
    LoginTabModel(pageNumber: '2', isChecked: false),
    LoginTabModel(pageNumber: '3', isChecked: false),
  ];
}
