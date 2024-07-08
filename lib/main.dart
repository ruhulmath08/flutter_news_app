import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/config/theme/app_themes.dart';
import 'package:flutter_news_app/features/daily_news/presentation/bloc/remote/remote_articles_bloc.dart';
import 'package:flutter_news_app/features/daily_news/presentation/pages/article_page.dart';
import 'package:flutter_news_app/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => RemoteArticleBloc(
            getArticleUseCase: sl(),
          )..add(const GetArticles()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: them(),
        home: const ArticlePage(),
      ),
    );
  }
}
