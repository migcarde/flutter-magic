class PictureDto {
  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  PictureDto({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  factory PictureDto.fromJson(Map<String, dynamic> json) {
    return PictureDto(
        author: json['author'] as String,
        downloadUrl: json['download_url'] as String,
        height: json['height'] as int,
        id: json['id'] as String,
        url: json['url'] as String,
        width: json['width'] as int);
  }
}
