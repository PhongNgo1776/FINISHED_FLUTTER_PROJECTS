
import 'package:swjfla/models/VideoInfo.dart';

class TypeVideo {
  final String name;
  final String imageLink;
  final List<VideoInfo> filmList;

  TypeVideo({this.name, this.imageLink, this.filmList});
  
  factory TypeVideo.fromJson(Map<String, dynamic> json) {
    var list = json['filmList'] as List;
    print(list.runtimeType);
    List<VideoInfo> videosList = list.map((i) => VideoInfo.fromJson(i)).toList();

    return TypeVideo(
      name: json['name'] as String,
      imageLink: json['image'] as String,
      filmList: videosList
    );
  }
}