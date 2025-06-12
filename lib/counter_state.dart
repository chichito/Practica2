part of 'counter_bloc.dart';

class CounterState {
  final int contador;
  final String nombre;
  final Color color;

  CounterState({this.contador = 0, this.nombre = '', this.color = Colors.blue});
}
