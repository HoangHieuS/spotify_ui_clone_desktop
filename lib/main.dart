import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
import 'package:spotify_ui_clone_desktop/data/data.dart';
// import 'package:spotify_ui_clone_desktop/models/models.dart';
import 'package:spotify_ui_clone_desktop/screens/screens.dart';
import 'package:spotify_ui_clone_desktop/widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData darkTheme = ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Montserrat',
          ),
      primaryTextTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Montserrat',
          ),
    );
    return GetMaterialApp(
      title: 'Spotify UI Clone',
      debugShowCheckedModeBanner: false,
      theme: darkTheme.copyWith(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        colorScheme:
            darkTheme.colorScheme.copyWith(secondary: const Color(0xFF1DB954)),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.grey[300],
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1,
          ),
        ),
      ),
      home: const Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) const SideMenu(),
                const Expanded(
                  child: PlaylistScreen(playlist: lofihiphopPlaylist),
                ),
              ],
            ),
          ),
          const CurrentTrack(),
        ],
      ),
    );
  }
}
