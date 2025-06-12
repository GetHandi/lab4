import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cosmic_velocity_cubit.dart';
import 'screens/cosmic_velocity_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная работа #4 (Иваненков А.И.)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CosmicVelocityCubit(),
        child: CosmicVelocityScreen(),
      ),
    );
  }
}