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
