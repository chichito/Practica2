import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(contador: 0, nombre: 'no-name')) {
    List<String> nombres = [
      'Juan',
      'Pedro',
      'Ana',
      'Luis',
      'Angel',
      'Fernando',
      'Santiago',
      'Andrea',
      'Maria',
      'Gaby',
      'Marizol',
      'Enrique',
      'Carlos',
      'David',
      'Roberto',
    ];
    on<NombreAleatorioEvent>((event, emit) {
      Random random = Random();
      int randomNumber = random.nextInt(
        15,
      ); // Generar un número aleatorio entre 0 y 14
      final nombreAleatorio = nombres[randomNumber];
      final nombre = '$nombreAleatorio $randomNumber';
      final counterState = CounterState(
        contador: state.contador,
        nombre: nombre,
        color: state.color,
      );
      emit(counterState);
    });
    on<ContarEvent>((event, emit) {
      var contar = state.contador + 1;
      if (contar > 15) {
        contar = 0; // Reiniciar el contador si supera 15
      }
      Color color = Colors.blue;
      if (contar > 10) {
        color = Colors.red;
      } else {
        color = Colors.blue;
      }
      final counterState = CounterState(
        contador: contar,
        nombre: state.nombre,
        color: color,
      );
      emit(counterState);
    });
  }
}
