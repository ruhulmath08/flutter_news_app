part of 'local_articles_bloc.dart';

@immutable
sealed class LocalArticlesState extends Equatable {
  const LocalArticlesState({this.articles});

  final List<ArticleEntity>? articles;

  @override
  List<Object> get props => [articles!];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticlesState {
  const LocalArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}
