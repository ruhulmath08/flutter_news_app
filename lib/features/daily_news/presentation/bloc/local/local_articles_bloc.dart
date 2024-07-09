import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/get_saved_articles_use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/remove_article_use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/save_article_use_case.dart';

part 'local_articles_event.dart';
part 'local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  LocalArticlesBloc(
    this._getSavedArticlesUseCase,
    this._removeArticleUseCase,
    this._saveArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  void onGetSavedArticles(
    GetSavedArticles getSavedArticles,
    Emitter<LocalArticlesState> emit,
  ) async {
    final List<ArticleEntity> articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
    RemoveArticle removeArticle,
    Emitter<LocalArticlesState> emit,
  ) async {
    await _removeArticleUseCase(params: removeArticle.articleEntity);
    final List<ArticleEntity> articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
    SaveArticle saveArticle,
    Emitter<LocalArticlesState> emit,
  ) async {
    await _saveArticleUseCase(params: saveArticle.articleEntity);
    final List<ArticleEntity> articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }
}
