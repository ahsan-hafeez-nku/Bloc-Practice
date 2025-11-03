import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log(
      "Bloc Created: ${bloc.state.toString()} :${bloc.runtimeType.toString()}",
    );
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change: ${change.nextState.toString()}");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change: ${transition.toString()}");
    super.onTransition(bloc, transition);
  }
}
