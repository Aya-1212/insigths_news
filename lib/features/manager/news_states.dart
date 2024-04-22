import 'package:insigths_news/features/model/news_model/news_model.dart';
import 'package:insigths_news/features/model/source_model/source_model.dart';

class NewsStates {}

class NewsInitialState extends NewsStates {}

///////////////////////////////////////////////////////////////////////////////////
///category
class NewsByCategoryLoadingState extends NewsStates {}

class NewsByCategorySucessState extends NewsStates {
  final NewsModel model;

  NewsByCategorySucessState({required this.model});
}

class NewsByCategoryErrorState extends NewsStates {}

///////////////////////////////////////////////////////////////////////////////////
///image
class NewsImageByCategoryLoadingState extends NewsStates {}

class NewsImageByCategorySucessState extends NewsStates {
  final NewsModel model;

  NewsImageByCategorySucessState({required this.model});
}

class NewsImageByCategoryErrorState extends NewsStates {}

/////////////////////////////////////////////////////////////////////////////////////////
///search
class NewsBySearchLoadingState extends NewsStates {}

class NewsBySearchSucessState extends NewsStates {
  final NewsModel model;

  NewsBySearchSucessState({required this.model});
}

class NewsBySearchErrorState extends NewsStates {}
//////////////////////////////////////////////////////////////////////////////////////////
///sources
 class NewsBySourcesLoadingState extends NewsStates {}

class NewsBySourcesSucessState extends NewsStates {
  final SourceModel sources;

  NewsBySourcesSucessState({required this.sources});
}

class NewsBySourcesErrorState extends NewsStates {}
//////////////////////////////////////////////////////////////////////////////////////////////
///
 class ArticlesBySourcesLoadingState extends NewsStates {}

class ArticlesBySourcesSucessState extends NewsStates {
  final NewsModel model;

  ArticlesBySourcesSucessState({required this.model});
}

class ArticlesBySourcesErrorState extends NewsStates {}
