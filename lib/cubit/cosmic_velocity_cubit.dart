import 'package:flutter_bloc/flutter_bloc.dart';
import 'cosmic_velocity_state.dart';
import 'dart:math';

class CosmicVelocityCubit extends Cubit<CosmicVelocityState> {
  CosmicVelocityCubit() : super(InputState());

  void returnToInput() {
    emit(InputState());
  }

  void calculateVelocity(double mass, double radius) {
    if (mass <= 0 || radius <= 0) {
      emit(ErrorState('Масса и радиус должны быть положительными'));
      return;
    }

    emit(LoadingState());

    Future.delayed(Duration(milliseconds: 500), () {
      try {
        const gravitationalConstant = 6.67430e-11;
        final velocity = sqrt((gravitationalConstant * mass) / radius);
        emit(ResultState(velocity, mass, radius));
      } catch (e) {
        emit(ErrorState('Ошибка расчета: $e'));
      }
    });
  }
}