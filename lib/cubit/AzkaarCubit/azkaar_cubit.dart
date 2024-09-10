import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Models/Azkaar/main_azkaar_model.dart';


part 'azkaar_state.dart';

class AzkaarCubit extends Cubit<AzkaarState> {
  AzkaarCubit() : super(AzkaarInitial());
  void getAzkaar() async {
    final response =await rootBundle.loadString('assets/jsons/adhkar.json');
    final data = json.decode(response) as List;
    final ozkor = data.map((zikr) {
      return MainAzkaarModel.fromjson(zikr);
    }).toList();
    emit(AzkaarLoaded(ozkor));
  }
}
