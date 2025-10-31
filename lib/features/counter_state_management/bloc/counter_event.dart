part of 'counter_bloc.dart';

//abstract class
sealed class CounterEvent {}

//event
class CounterIncremented extends CounterEvent {}

class CounterDecremented extends CounterEvent {}
