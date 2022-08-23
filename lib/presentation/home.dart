import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:myapp/domain/day.dart';

import '../domain/state/home/home_state.dart';
import '../internal/dependencies/home_module.dart';

const String fName ='lib/presentation/home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  late HomeState _homeState;

  Day? _day;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    log('-->> $fName, _getBody ->> _day: $_day');
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getRowInput(),
            const SizedBox(height: 20),
            RaisedButton(
              onPressed: _getDay,
              child: const Text('Получить'),
            ),
            const SizedBox(height: 20),
            if (_day != null) _getDayInfo(_day!),
          ],
        ),
      ),
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Широта'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo(Day day) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Восход: ${day.sunrise.toLocal()}'),
        Text('Заход: ${day.sunset.toLocal()}'),
        Text('Полдень: ${day.solarNoon.toLocal()}'),
        Text('Продолжительность: ${Duration(seconds: day.dayLength)}'),
      ],
    );
  }

  void _getDay() {
    // здесь получаем данные
    final lat = double.tryParse(_latController.text);
    final lng = double.tryParse(_lngController.text);
    _homeState.getDay(latitude: lat!, longitude: lng!);
  }
}
