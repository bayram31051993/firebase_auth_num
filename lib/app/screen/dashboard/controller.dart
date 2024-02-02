import 'package:get/get.dart';
import 'package:test_project/app/screen/screen.dart';

class DashboardController extends GetxController {
  final state = DashBoardState();

  void onChangeIndex(value) {
    state.bottomIndex.value = value;
  }
}
