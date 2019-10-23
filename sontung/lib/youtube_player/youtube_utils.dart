import 'package:flutter/cupertino.dart';

/// Quality of Thumbnail
enum ThumbnailQuality {
  DEFAULT,
  HIGH,
  MEDIUM,
  STANDARD,
  MAX,
}

class YoutubeUtils{
  
  /// Converts fully qualified YouTube Url to video id.
  static String convertUrlToId(String url, [bool trimWhitespaces = true]) {
    if (!url.contains("http") && (url.length == 11)) return url;
    if (url == null || url.length == 0) return null;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }

    return null;
  }

  /// Grabs YouTube video's thumbnail for provided video id.
  static String getThumbnail(
      {@required String videoId,
      ThumbnailQuality quality = ThumbnailQuality.STANDARD}) {
    String _thumbnailUrl = 'https://i3.ytimg.com/vi/$videoId/';
    switch (quality) {
      case ThumbnailQuality.DEFAULT:
        _thumbnailUrl += 'default.jpg';
        break;
      case ThumbnailQuality.HIGH:
        _thumbnailUrl += 'hqdefault.jpg';
        break;
      case ThumbnailQuality.MEDIUM:
        _thumbnailUrl += 'mqdefault.jpg';
        break;
      case ThumbnailQuality.STANDARD:
        _thumbnailUrl += 'sddefault.jpg';
        break;
      case ThumbnailQuality.MAX:
        _thumbnailUrl += 'maxresdefault.jpg';
        break;
    }
    return _thumbnailUrl;
  }
}