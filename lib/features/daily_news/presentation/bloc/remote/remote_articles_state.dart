part of 'remote_articles_bloc.dart';

@immutable
sealed class RemoteArticlesState extends Equatable {
  const RemoteArticlesState({this.articles, this.dioException});

  final List<ArticleEntity>? articles;
  final DioException? dioException;

  @override
  List<Object> get props => [
        articles!,
        dioException!,
      ];
}

class RemoteArticlesLoading extends RemoteArticlesState {}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioException dioException)
      : super(dioException: dioException);
}
