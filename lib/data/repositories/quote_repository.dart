import '../../api_constants.dart';
import '../data_resourse/data_service.dart';
import '../models/quote_model.dart';

class QuoteRepository {
  final ApiService apiService;

  QuoteRepository(this.apiService);

  Future<QuoteModel> getRandomQuote() async {
    final response = await apiService.getData(ApiConstants.randomQuotePath);
    return QuoteModel.fromJson(response.data);
  }

  Future<QuoteModel> getRandomQuoteByTitle({required String title}) async {
    final response = await apiService.getData(
        ApiConstants.randomQuoteByTitlePath,
        queryParams: {'title': title});
    return QuoteModel.fromJson(response.data);
  }

  Future<QuoteModel> getRandomQuoteByCharacter({required String character}) async {
    final response = await apiService.getData(
        ApiConstants.randomQuoteByCharacterPath,
        queryParams: {'character': character});
    return QuoteModel.fromJson(response.data);
  }

  Future<List<QuoteModel>> getTenRandomQuote() async {
    final response = await apiService.getData(ApiConstants.getTenRandomQuotePath);
    return (response.data as List).map((e) => QuoteModel.fromJson(e)).toList();
  }

  Future<List<QuoteModel>> getTenRandomQuoteByTitle() async {
    final response = await apiService.getData(ApiConstants.getTenRandomQuoteByTitlePath);
    return (response.data as List).map((e) => QuoteModel.fromJson(e)).toList();
  }

  Future<List<QuoteModel>> getTenRandomQuoteByCharacter() async {
    final response = await apiService.getData(ApiConstants.getTenRandomQuoteByCharacterPath);
    return (response.data as List).map((e) => QuoteModel.fromJson(e)).toList();
  }
}
