class VideoInfo {
  final String title;
  final String content;
  final String videoKey;

  VideoInfo({this.title, this.content, this.videoKey});

  factory VideoInfo.fromJson(Map<String, dynamic> json) {
    return VideoInfo(
      title: json['title'] as String,
      content: json['content'] as String,
      videoKey: json['videoKey'] as String,
    );
  }
}