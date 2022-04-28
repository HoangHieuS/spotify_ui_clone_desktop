import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui_clone_desktop/controller/song_controller.dart';
import 'package:spotify_ui_clone_desktop/data/data.dart';
import 'package:spotify_ui_clone_desktop/models/models.dart';
import 'package:spotify_ui_clone_desktop/widgets/widgets.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;
  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12),
      dataRowHeight: 54,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((e) {
        final selected =
            context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle = TextStyle(
            color: selected
                ? const Color(0xFF1DB954)
                : Theme.of(context).iconTheme.color);
        // bool _isSelected = true;
        // final textStyle = _isSelected == true
        //     ? const TextStyle(
        //         color: Color(0xFF1DB954),
        //       )
        //     : TextStyle(color: Theme.of(context).iconTheme.color);
        return DataRow(
          cells: [
            DataCell(
              Text(
                e.title,
                style: textStyle,
              ),
            ),
            DataCell(
              Text(
                e.artist,
                style: textStyle,
              ),
            ),
            DataCell(
              Text(
                e.album,
                style: textStyle,
              ),
            ),
            DataCell(
              Text(
                e.duration,
                style: textStyle,
              ),
            ),
          ],
          selected: selected,
          onSelectChanged: (_) => Get.to(
            CurrentTrack(track: e),
          ),
          // context.read<CurrentTrackModel>().selectTrack(e),
          // Get.put(SongController()).getCurrentSong(id: e.id, title: e.title, artist: e.artist),
        );
      }).toList(),
    );
  }
}
