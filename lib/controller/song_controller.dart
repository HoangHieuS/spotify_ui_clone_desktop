import 'package:get/get.dart';

class CurrentTrackController extends GetxController {
  RxString id = ''.obs;
  RxString title = ''.obs;
  RxString artist = ''.obs;
  RxString duration = ''.obs;

  void setCurrentTrack(id, title, artist, duration) {
    this.id.value = id;
    this.title.value = title;
    this.artist.value = artist;
    this.duration.value = duration;
  }
}
