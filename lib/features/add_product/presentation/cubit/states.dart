abstract class AddProductState{}
class InitialState extends AddProductState{}
class AddImageSuccessState extends AddProductState{}
class AddImageLoadingState extends AddProductState{}
class AddImageErrorState extends AddProductState{
  String message;
  AddImageErrorState(this.message);
}
