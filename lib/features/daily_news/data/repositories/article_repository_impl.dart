import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_news_app/core/constants/api_constants.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/daily_news/data/data_sources/remote/article_remote_data_source.dart';
import 'package:flutter_news_app/features/daily_news/data/models/article_model.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _articleRemoteDataSource;

  ArticleRepositoryImpl(this._articleRemoteDataSource);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _articleRemoteDataSource.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusCode,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }
}
