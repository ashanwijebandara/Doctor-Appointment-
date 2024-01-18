import 'package:get/get.dart';

class FavoriteDoctorsController extends GetxController {
  RxList<String> favoriteDoctorIds = <String>[].obs;

  void addToFavorites(String doctorId) {
    favoriteDoctorIds.add(doctorId);
  }

  void removeFromFavorites(String doctorId) {
    favoriteDoctorIds.remove(doctorId);
  }

  bool isFavorite(String doctorId) {
    return favoriteDoctorIds.contains(doctorId);
  }
}
