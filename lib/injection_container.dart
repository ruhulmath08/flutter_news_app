import 'package:dio/dio.dart';
import 'package:flutter_news_app/features/daily_news/data/data_sources/remote/article_remote_data_source.dart';
import 'package:flutter_news_app/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:flutter_news_app/features/daily_news/domain/repositories/article_repository.dart';
import 'package:flutter_news_app/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_articles_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Datasource
  sl.registerSingleton<ArticleRemoteDataSource>(ArticleRemoteDataSource(sl()));

  //Repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(getArticleUseCase: sl()),
  );
}
