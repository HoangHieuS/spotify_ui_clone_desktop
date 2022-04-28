import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui_clone_desktop/data/data.dart';

import '../models/models.dart';

class CurrentTrack extends StatelessWidget {
  final Song? track;
  const CurrentTrack({Key? key, this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _TrackInfo(track: track),
            const Spacer(),
            _PlayerControls(track: track),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) const _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({
    Key? key,
    this.track,
  }) : super(key: key);

  final Song? track;

  @override
  Widget build(BuildContext context) {
    // final selected = context.watch<CurrentTrackModel>().selected;
    if (track == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              track!.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 4),
            Text(
              track!.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  final Song? track;
  const _PlayerControls({Key? key, this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final selected = context.watch<CurrentTrackModel>().selected;

    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 34,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 20,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat),
              iconSize: 20,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.caption),
            const SizedBox(width: 8),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              track?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_up_outlined),
              onPressed: () {},
            ),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
