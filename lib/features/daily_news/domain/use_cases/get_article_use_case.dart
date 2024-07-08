import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/core/use_cases/use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  GetArticleUseCase(this._articleRepository);
  final ArticleRepository _articleRepository;

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
