import '../inputs/search_art_previews_input.dart';
import '../models/details/art_details.dart';
import '../models/pagination/pagination.dart';
import '../models/preview/art_preview.dart';

abstract class ArtRepository {
  Future<PaginatedResponse<ArtPreview>> searchArtPreviews(SearchArtPreviewsInput input);

  Future<ArtDetails> fetchArtDetails(int artId);
}
