import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:quraan_app1/cubit/prayertimes_state.dart';


class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());

  // دالة لجلب مواقيت الصلاة
  Future<void> fetchPrayerTimes(
      double latitude, double longitude, DateTime date) async {
    try {
      emit(PrayerTimesLoading());

      final formattedDate = DateFormat('dd-MM-yyyy').format(date);
      final url =
          'http://api.aladhan.com/v1/timings/$formattedDate?latitude=$latitude&longitude=$longitude&method=2';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data']['timings'];
        emit(PrayerTimesLoaded(data, date));
      } else {
        emit(PrayerTimesError('Failed to load prayer times'));
      }
    } catch (e) {
      emit(PrayerTimesError('An error occurred: $e'));
    }
  }
}
