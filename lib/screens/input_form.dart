import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cosmic_velocity_cubit.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  final _massController = TextEditingController();
  final _radiusController = TextEditingController();
  bool _agreementChecked = false;

  @override
  void dispose() {
    _massController.dispose();
    _radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _massController,
              decoration: InputDecoration(
                labelText: 'Масса небесного тела (кг)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите массу';
                }
                if (double.tryParse(value) == null) {
                  return 'Введите корректное число';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _radiusController,
              decoration: InputDecoration(
                labelText: 'Радиус небесного тела (м)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите радиус';
                }
                if (double.tryParse(value) == null) {
                  return 'Введите корректное число';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text('Я согласен на обработку данных'),
              value: _agreementChecked,
              onChanged: (bool? value) {
                setState(() {
                  _agreementChecked = value ?? false;
                });
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() && _agreementChecked) {
                  final mass = double.parse(_massController.text);
                  final radius = double.parse(_radiusController.text);
                  context.read<CosmicVelocityCubit>().calculateVelocity(mass, radius);
                } else if (!_agreementChecked) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Необходимо согласие на обработку данных')),
                  );
                }
              },
              child: Text('Рассчитать'),
            ),
          ],
        ),
      ),
    );
  }
}