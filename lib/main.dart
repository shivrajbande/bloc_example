import 'package:bloc_project/variable_block.dart';
import 'package:bloc_project/variable_event.dart';
import 'package:bloc_project/variable_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: variableMainBloc(),
    );
  }

  variableMainBloc() {
    return BlocListener<CounterBloc, UpdateState>(
      listener: (context, state) {},
      child: BlocBuilder<CounterBloc, UpdateState>(
        builder: (context, state) {
          if (state is VariableUpdateState) {
            _counter = state.x!;
            return bodyLoader(context);
          }
          return bodyLoader(context);
        },
      ),
    );
  }

  Widget bodyLoader(context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                color: Colors.green,
                padding:const  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<CounterBloc>(context)
                        .add(VariableUpdateEvent(_counter));
                  },
                  child: Text("click value is +$_counter"),
                ),
              ),
            ],
          ),
        ));
  }
}
