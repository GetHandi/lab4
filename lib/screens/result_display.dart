
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cosmic_velocity_cubit.dart';
import 'dart:math';

class ResultDisplay extends StatelessWidget {
  final double velocity;
  final double mass;
  final double radius;

  const ResultDisplay({
    Key? key,
    required this.velocity,
    required this.mass,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final earthMass = 5.972e24;
    final earthRadius = 6.371e6;
    final earthVelocity = sqrt((6.67430e-11 * earthMass) / earthRadius);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Первая космическая скорость:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              '${velocity.toStringAsFixed(2)} м/с',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Для сравнения: для Земли = ${earthVelocity.toStringAsFixed(2)} м/с',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32),
            Text(
              'Параметры расчета:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Масса: ${mass.toStringAsExponential(2)} кг'),
            Text('Радиус: ${radius.toStringAsExponential(2)} м'),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.read<CosmicVelocityCubit>().returnToInput(),
              child: Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}