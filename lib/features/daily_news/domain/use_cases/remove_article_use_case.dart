import 'package:flutter_news_app/core/use_cases/use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  RemoveArticleUseCase(this._articleRepository);
  final ArticleRepository _articleRepository;

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
