import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cosmic_velocity_cubit.dart';
import '../cubit/cosmic_velocity_state.dart';
import 'input_form.dart';
import 'result_display.dart';

class CosmicVelocityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор космической скорости'),
      ),
      body: BlocBuilder<CosmicVelocityCubit, CosmicVelocityState>(
        builder: (context, state) {
          if (state is InputState) {
            return InputForm();
          } else if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ResultState) {
            return ResultDisplay(
              velocity: state.velocity,
              mass: state.mass,
              radius: state.radius,
            );
          } else if (state is ErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: TextStyle(color: Colors.red)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.read<CosmicVelocityCubit>().returnToInput(),
                    child: Text('Вернуться'),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}