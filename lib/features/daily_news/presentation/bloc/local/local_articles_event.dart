part of 'local_articles_bloc.dart';

@immutable
sealed class LocalArticlesEvent extends Equatable {
  const LocalArticlesEvent({this.articleEntity});
  final ArticleEntity? articleEntity;

  @override
  List<Object> get props => [articleEntity!];
}

class GetSavedArticles extends LocalArticlesEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticlesEvent {
  const RemoveArticle(ArticleEntity article) : super(articleEntity: article);
}

class SaveArticle extends LocalArticlesEvent {
  const SaveArticle(ArticleEntity article) : super(articleEntity: article);
}
