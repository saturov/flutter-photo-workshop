import 'package:json_annotation/json_annotation.dart';
import 'package:sharing_codelab/photos_library_api/album.dart';

part 'share_album_response.g.dart';

@JsonSerializable()
class ShareAlbumResponse {
  ShareAlbumResponse(this.shareInfo);

  factory ShareAlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$ShareAlbumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShareAlbumResponseToJson(this);

  ShareInfo shareInfo;
}
