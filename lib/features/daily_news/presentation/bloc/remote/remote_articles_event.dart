part of 'remote_articles_bloc.dart';

@immutable
sealed class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

class GetArticles extends RemoteArticlesEvent {
  const GetArticles();
}
