class ImageItemModel {
  String imageUrl;
  String tag;
  int likes;

  ImageItemModel({
    required this.imageUrl,
    required this.tag,
    required this.likes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItemModel && runtimeType == other.runtimeType && imageUrl == other.imageUrl && tag == other.tag && likes == other.likes);

  @override
  int get hashCode => imageUrl.hashCode ^ tag.hashCode ^ likes.hashCode;

  @override
  String toString() => 'ImageItemModel{ imageUrl: $imageUrl, tag: $tag, likes: $likes,}';

  ImageItemModel copyWith({
    String? imageUrl,
    String? tag,
    int? likes,
  }) {
    return ImageItemModel(
      imageUrl: imageUrl ?? this.imageUrl,
      tag: tag ?? this.tag,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
      'tag': this.tag,
      'likes': this.likes,
    };
  }

  factory ImageItemModel.fromJson(Map<String, dynamic> map) {
    return ImageItemModel(
      imageUrl: map['imageUrl'] as String,
      tag: map['tag'] as String,
      likes: map['likes'] as int,
    );
  }
}