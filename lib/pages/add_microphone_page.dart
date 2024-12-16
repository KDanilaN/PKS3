import 'package:flutter/material.dart';
import 'package:pks_3/models/microphone.dart';

class AddMicrophonePage extends StatefulWidget {
  const AddMicrophonePage({super.key});

  @override
  State<AddMicrophonePage> createState() => _AddMicrophonePageState();
}

class _AddMicrophonePageState extends State<AddMicrophonePage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _image = ''; // Путь к изображению
  String _info = '';
  double _price = 0;
  String _frequencyResponse = '';
  String _polarPattern = '';
  String _listen = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить микрофон'),
        backgroundColor: const Color.fromRGBO(42, 157, 143, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Путь к изображению'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите путь к изображению';
                  }
                  return null;
                },
                onSaved: (value) => _image = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Цена'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите цену';
                  }
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Частотный диапазон'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите частотный диапазон';
                  }
                  return null;
                },
                onSaved: (value) => _frequencyResponse = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Полярный паттерн'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите полярный паттерн';
                  }
                  return null;
                },
                onSaved: (value) => _polarPattern = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ссылка для покупки'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите ссылку для покупки';
                  }
                  return null;
                },
                onSaved: (value) => _listen = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Создаем новый микрофон
                    final newMicrophone = Microphone(
                      name: _name,
                      image: _image, // Путь к изображению
                      info: _info,
                      price: _price,
                      frequencyResponse: _frequencyResponse,
                      polarPattern: _polarPattern,
                      listen: _listen,
                    );

                    // Возвращаем новый микрофон на предыдущий экран
                    Navigator.pop(context, newMicrophone);
                  }
                },
                child: const Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}