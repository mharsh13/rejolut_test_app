import 'package:flutter/material.dart';

class AlbumIdProvider with ChangeNotifier {
  late int albumId;

  void setAlbumId(int albumId) {
    this.albumId = albumId;
    notifyListeners();
  }
}
