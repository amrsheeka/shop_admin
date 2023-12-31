abstract class MainLayoutState{}
class InitialState extends MainLayoutState{}
class ChangeCurrentIndexState extends MainLayoutState{}
class GetCategoriesLoadingState extends MainLayoutState{}
class GetCategoriesSuccessState extends MainLayoutState{}
class GetCategoriesErrorState extends MainLayoutState{
  String message;
  GetCategoriesErrorState(this.message);
}