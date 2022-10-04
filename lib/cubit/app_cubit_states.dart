import 'package:equatable/equatable.dart';
import 'package:trave_tutorial_app/model/data_model.dart';

abstract class CubitStates extends Equatable {}

//todo app que usa Cubit, deve ter um estado inicial
class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//esse estado é responsável por mostrar a primeira página do app
class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//estado de carregamento
class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.places);
  final DataModel places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}
