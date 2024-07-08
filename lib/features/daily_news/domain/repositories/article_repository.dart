import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article_entity.dart';

abstract interface class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
