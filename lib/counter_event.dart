part of 'counter_bloc.dart';

sealed class CounterEvent {}

class NombreAleatorioEvent extends CounterEvent {}

class ContarEvent extends CounterEvent {}
