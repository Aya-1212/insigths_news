import 'package:bloc/bloc.dart';
import 'package:insigths_news/core/services/api_services.dart';
import 'package:insigths_news/features/manager/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
/////////////////////////////////////////////////////////////////category
  getNewsByCategory(String category) {
    emit(NewsByCategoryLoadingState());

    try {
      ApiServices.getNewsByCategoryApi(category).then((value) {
        emit(NewsByCategorySucessState(model: value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState());
    }
  }
///////////////////////////////////////////////////////////////imagecarousel
  getNewsImageByCategory() {
    emit(NewsImageByCategoryLoadingState());

    try {
      ApiServices.getNewsByCategoryImageGeneralApi().then((value) {
        emit(NewsImageByCategorySucessState(model: value!));
      });
    } catch (e) {
      emit(NewsImageByCategoryErrorState());
    }
  }
////////////////////////////////////////////////////////////////search
  getNewsBySearch(String query) {
    emit(NewsBySearchLoadingState());

    try {
      ApiServices.getNewsBySearchApi(query).then((value) {
        emit(NewsBySearchSucessState(model: value!));
      });
    } catch (e) {
      emit(NewsBySearchErrorState());
    }
  }
/////////////////////////////////////////////////////sources
  getNewsBySource (){
    emit(NewsBySourcesLoadingState());
    try{
      ApiServices.getNewsBySourcesApi().then((value){
        emit(NewsBySourcesSucessState(sources: value!));
      } ) ;
    }catch(e){    emit(NewsBySourcesErrorState());
}
  }
/////////////////////////////////////////////////////news by source
  getArticlesBySource (String sourceId){
    emit(ArticlesBySourcesLoadingState());
    try{
      ApiServices.getAeticlesByChooseSourcesApi(sourceId).then((value){
        emit(ArticlesBySourcesSucessState(model: value!));
      } ) ;
    }catch(e){
    emit(ArticlesBySourcesErrorState());
}
  }

}
