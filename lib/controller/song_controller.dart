import 'package:get/get.dart';

class SongController extends GetxController {
  String? id;
  String? title;
  String? artist;

  getCurrentSong({
    required id,
    required title,
    required artist,
  }) {
    this.id = id;
    this.title = title;
    this.artist = artist;
  }
}

class CurrentTrackController extends GetxController {
  RxString id = ''.obs;
  RxString title = ''.obs;
  RxString artist = ''.obs;

  void setCurrentTrack(id, title, artist) {
    this.id.value = id;
    this.title.value = title;
    this.artist.value = artist;
  }
}
