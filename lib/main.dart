import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica2/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CounterBloc())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const PracticaEstados(),
      ),
    );
  }
}

class PracticaEstados extends StatelessWidget {
  const PracticaEstados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Práctica de Estados')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Nombre: ${state.nombre}');
              },
            ),
            SizedBox(height: 8),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: state.color,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  onPressed: () {
                    context.read<CounterBloc>().add(ContarEvent());
                  },
                  child: Text(
                    '+${state.contador}',
                    style: TextStyle(fontSize: 24, color: state.color),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FilledButton(
          onPressed: () {
            // Aquí se llamaría al Bloc para incrementar el contador
            // BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            context.read<CounterBloc>().add(NombreAleatorioEvent());
          },
          child: const Text('Nombre Aleatorio'),
        ),
      ),
    );
  }
}
