import 'package:freezed_annotation/freezed_annotation.dart';

part 'art_details.freezed.dart';
part 'art_details.g.dart';

@freezed
class ArtDetails with _$ArtDetails {
  const factory ArtDetails({
    required int id,
    required String title,
    required String? description,
    @JsonKey(name: 'image_id') required String? imageId,
    @JsonKey(name: 'date_display') required String? date,
    @JsonKey(name: 'artist_display') required String? artist,
    @JsonKey(name: 'place_of_origin') required String? origin,
    @JsonKey(name: 'gallery_title') required String? gallery,
    @JsonKey(name: 'department_title') required String? department,
    @JsonKey(name: 'medium_display') String? mediumDisplay,
    @JsonKey(name: 'dimensions') String? dimensions,
    @JsonKey(name: 'credit_line') String? creditLine,
    @JsonKey(name: 'is_on_view') bool? isOnView,
    @JsonKey(name: 'artwork_type_title') String? artworkTypeTitle,
  }) = _ArtDetails;

  const ArtDetails._();

  factory ArtDetails.fromJson(Map<String, dynamic> json) =>
      _$ArtDetailsFromJson(json);

  String get fullImageUrl =>
      'https://www.artic.edu/iiif/2/$imageId/full/843,/0/default.jpg';
}
