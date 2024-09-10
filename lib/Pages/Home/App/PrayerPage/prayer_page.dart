import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../../../Core/Constant/color_app.dart';
import '../../../../cubit/prayertimes_cubit.dart';
import '../../../../cubit/prayertimes_state.dart';

class DatePickerPrayerTimes extends StatelessWidget {
  final LocationData currentPosition;

  const DatePickerPrayerTimes({super.key, required this.currentPosition});

  void _fetchPrayerTimesForDate(BuildContext context, DateTime selectedDate) {
    context.read<PrayerTimesCubit>().fetchPrayerTimes(
          currentPosition.latitude!,
          currentPosition.longitude!,
          selectedDate,
        );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(today.year, today.month - 1),
      lastDate: DateTime(today.year, today.month + 1),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ColorApp.whitePink,
            hintColor: ColorApp.whitePink,
            colorScheme: const ColorScheme.light(primary: ColorApp.whitePink),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != today) {
      _fetchPrayerTimesForDate(context, picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchPrayerTimesForDate(context, DateTime.now());
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Prayer',
          style: TextStyle(
            color: ColorApp.purple,
            fontSize: 24,
            fontFamily: 'Poppins Bold',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.whitePink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                'Show Dates',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins Regular',
                  color: ColorApp.purple,
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
              builder: (context, state) {
                if (state is PrayerTimesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PrayerTimesLoaded) {
                  return Expanded(
                    child: Card(
                      color: ColorApp.whitePink,
                      elevation: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Prayer Times for ${DateFormat('EEEE, d MMMM y').format(state.selectedDate)}',
                              style: const TextStyle(
                                  fontSize: 22, fontFamily: 'Poppins SemiBold'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Divider(thickness: 1, color: ColorApp.purple),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.prayerTimes.length,
                              itemBuilder: (context, index) {
                                String key =
                                    state.prayerTimes.keys.elementAt(index);
                                String value = state.prayerTimes[key] ?? '';

                                // الحصول على الاسم العربي للصلاة
                                String arabicName = _getArabicPrayerName(key);

                                // عرض الصلوات فقط مع الأسماء العربية
                                return arabicName.isNotEmpty
                                    ? ListTile(
                                        title: Text(
                                          arabicName,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Poppins SemiBold',
                                              color: ColorApp.purple),
                                        ),
                                        subtitle: Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Poppins Regular'),
                                        ),
                                      )
                                    : const SizedBox.shrink();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Failed to load prayer times',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins Regular',
                        color: ColorApp.purple,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getArabicPrayerName(String prayerName) {
    switch (prayerName) {
      case 'Fajr':
        return 'الفجر';
      case 'Dhuhr':
        return 'الظهر';
      case 'Asr':
        return 'العصر';
      case 'Maghrib':
        return 'المغرب';
      case 'Isha':
        return 'العشاء';
      default:
        return '';
    }
  }
}
