import 'package:get/get.dart';

// Creates a controller object with selectedPage observable variable using getx 
class NavController extends GetxController {
  var selectedPage = 'Home'.obs;

  void changePage(String page) {
    selectedPage.value = page;
  }
}

