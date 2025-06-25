import 'package:dio/dio.dart';

import '../inputs/search_art_previews_input.dart';
import '../models/details/art_details.dart';
import '../models/pagination/pagination.dart';
import '../models/preview/art_preview.dart';
import 'art_repository.dart';

class ArtRepositoryImpl implements ArtRepository {
  static const List<String> _previewFields = <String>[
    'id',
    'title',
    'image_id',
    'date_display',
    'artist_display',
    'place_of_origin',
  ];
  static const List<String> _detailsFields = <String>[
    'id',
    'title',
    'image_id',
    'date_display',
    'artist_display',
    'place_of_origin',
    'description',
    'gallery_title',
    'department_title',
  ];

  final Dio _dio;

  ArtRepositoryImpl(this._dio);

  @override
  Future<PaginatedResponse<ArtPreview>> searchArtPreviews(
    SearchArtPreviewsInput input,
  ) async {
    final Response<Object> response = await _dio.get(
      '/artworks/search',
      queryParameters: <String, Object>{
        'q': input.query,
        'page': input.page,
        'limit': input.limit,
        'fields': _previewFields.join(','),
      },
    );

    if (response.statusCode != 200) throw Exception('Cannot fetch search results');

    return PaginatedResponse<ArtPreview>.fromJson(
      response.data as Map<String, Object?>,
      (Object? data) => ArtPreview.fromJson(data as Map<String, Object?>),
    );
  }

  @override
  Future<ArtDetails> fetchArtDetails(int artId) async {
    final Response<Object> response = await _dio.get(
      '/artworks/$artId',
      queryParameters: <String, Object>{
        'fields': _detailsFields.join(','),
      },
    );

    if (response.statusCode != 200) throw Exception('Cannot fetch details');

    final Map<String, Object?> data =
        (response.data as Map<String, Object?>)['data'] as Map<String, Object?>;

    return ArtDetails.fromJson(data);
  }
}
