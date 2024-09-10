import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Models/Quraan/main_quran_model.dart';


part 'quraan_state.dart';

class QuraanCubit extends Cubit<QuraanState> {
  QuraanCubit() : super(QuraanInitial());
  void getQuraanData() async {
    final response = await rootBundle.loadString('assets/jsons/Quran.json');
    final data = json.decode(response) as List;
  
    final quraan = data.map((quran) => MainQuranModel.fromjson(quran)).toList();
   
    emit(QuraanLoaded(quraan));
  }
}
