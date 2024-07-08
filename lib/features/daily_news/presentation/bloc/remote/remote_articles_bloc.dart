import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/core/resources/data_state.dart';
import 'package:flutter_news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/get_article_use_case.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  RemoteArticleBloc({required this.getArticleUseCase})
      : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  final GetArticleUseCase getArticleUseCase;

  void onGetArticles(
    GetArticles event,
    Emitter<RemoteArticlesState> emit,
  ) async {
    final dataState = await getArticleUseCase.call();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.dioException!));
    }
  }
}
