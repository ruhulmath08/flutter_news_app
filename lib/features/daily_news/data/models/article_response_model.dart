import 'package:flutter_news_app/features/daily_news/data/models/article_model.dart';

class ArticleResponseModel {
  ArticleResponseModel({required this.articles});

  List<ArticleModel> articles;

  factory ArticleResponseModel.fromJson(
      Map<String, dynamic> articleResponseData) {
    return ArticleResponseModel(
      articles: ((articleResponseData['articles'] ?? []) as List<dynamic>)
          .map((dynamic article) => ArticleModel.fromJson(article))
          .toList(),
    );
  }
}
