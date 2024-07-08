import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/constants/api_constants.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'article_remote_data_source.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class ArticleRemoteDataSource {
  factory ArticleRemoteDataSource(Dio dio) = _ArticleRemoteDataSource;

  @GET('/top-headlines')
  Future<HttpResponse<ArticleResponseModel>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
