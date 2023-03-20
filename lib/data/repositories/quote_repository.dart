import 'package:api_handler/api_constants.dart';
import 'package:api_handler/data/models/quote_model.dart';

import '../data_resource/api_service.dart';

class QuoteRepository
{
  final ApiService apiService;

  QuoteRepository(this.apiService);

  Future<QuoteModel> getRandomQuote() async
  {
    final response = await apiService.getData(ApiConstants.randomQuotePath);
    return QuoteModel.fromJson(response.data);
  }

  Future<List<QuoteModel>> getTenRandomQuote() async
  {
    final response = await apiService.getData(ApiConstants.getTenRandomQuotePath);
    return (response.data as List).map((e) => QuoteModel.fromJson(e)).toList();
  }

  Future<QuoteModel> getRandomQuoteByTitle({required String title}) async
  {
    final response = await apiService.getData(ApiConstants.randomQuoteByTitlePath,queryParams: {'title':title});
    return QuoteModel.fromJson(response.data);
  }

}