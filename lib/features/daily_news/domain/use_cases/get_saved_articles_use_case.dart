import 'package:flutter_news_app/core/use_cases/use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<ArticleEntity>, void> {
  GetSavedArticlesUseCase(this._articleRepository);
  final ArticleRepository _articleRepository;

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
