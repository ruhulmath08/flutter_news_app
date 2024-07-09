import 'package:flutter/material.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/daily_news/presentation/pages/article/article_page.dart';
import 'package:flutter_news_app/features/daily_news/presentation/pages/article_details/article_details_page.dart';
import 'package:flutter_news_app/features/daily_news/presentation/pages/saved_articles/saved_articles_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const ArticlePage());

      case '/ArticleDetails':
        return _materialRoute(
          ArticleDetailsPage(
            article: settings.arguments as ArticleEntity,
          ),
        );

      case '/SavedArticles':
        return _materialRoute(const SavedArticlesPage());

      default:
        return _materialRoute(const ArticlePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
