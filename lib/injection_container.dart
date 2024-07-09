import 'package:dio/dio.dart';
import 'package:flutter_news_app/features/daily_news/data/data_sources/remote/article_remote_data_source.dart';
import 'package:flutter_news_app/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/get_saved_articles_use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/remove_article_use_case.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/save_article_use_case.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/local/local_articles_bloc.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/local_database/app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Datasource
  sl.registerSingleton<ArticleRemoteDataSource>(ArticleRemoteDataSource(sl()));

  //Repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(getArticleUseCase: sl()),
  );
  sl.registerFactory<LocalArticlesBloc>(
    () => LocalArticlesBloc(sl(), sl(), sl()),
  );
}
