// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_albums_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAlbumsResponse _$ListAlbumsResponseFromJson(Map<String, dynamic> json) {
  return ListAlbumsResponse(
      (json['albums'] as List)
          ?.map((e) =>
              e == null ? null : Album.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['nextPageToken'] as String);
}

Map<String, dynamic> _$ListAlbumsResponseToJson(ListAlbumsResponse instance) =>
    <String, dynamic>{
      'albums': instance.albums,
      'nextPageToken': instance.nextPageToken
    };
