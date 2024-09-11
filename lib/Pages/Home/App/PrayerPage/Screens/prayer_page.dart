import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../../../../Core/Constant/color_app.dart';
import '../../../../../cubit/Prayer Times/prayertimes_cubit.dart';
import '../../../../../cubit/Prayer Times/prayertimes_state.dart';
import '../Widgets/build_error_message.dart';
import '../Widgets/build_loading_indicator.dart';

class DatePickerPrayerTimes extends StatelessWidget {
  final LocationData currentPosition;

  const DatePickerPrayerTimes({super.key, required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    // جلب أوقات الصلاة للتاريخ الحالي عند بناء الواجهة
    context.read<PrayerTimesCubit>().fetchPrayerTimes(
          currentPosition.latitude!,
          currentPosition.longitude!,
          DateTime.now(),
        );

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
            _buildDateButton(context),
            const SizedBox(height: 20),
            _buildPrayerTimesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _selectDate(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorApp.whitePink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: const Text(
        'Show Dates',
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins Regular',
          color: ColorApp.purple,
        ),
      ),
    );
  }

  Widget _buildPrayerTimesList() {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        if (state is PrayerTimesLoading) {
          return const BuildLoadingIndicator();
        } else if (state is PrayerTimesLoaded) {
          return _buildPrayerTimesCard(state);
        } else {
          return const BuildErrorMessage();
        }
      },
    );
  }

  Widget _buildPrayerTimesCard(PrayerTimesLoaded state) {
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
                  fontSize: 22,
                  fontFamily: 'Poppins SemiBold',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(thickness: 1, color: ColorApp.purple),
            Expanded(
              child: ListView.builder(
                itemCount: state.prayerTimes.length,
                itemBuilder: (context, index) {
                  String key = state.prayerTimes.keys.elementAt(index);
                  String value = state.prayerTimes[key] ?? '';

                  String arabicName = _getArabicPrayerName(key);
                  String formattedTime = _formatPrayerTime(value);

                  return arabicName.isNotEmpty
                      ? ListTile(
                          title: Text(
                            arabicName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins SemiBold',
                              color: ColorApp.purple,
                            ),
                          ),
                          subtitle: Text(
                            formattedTime,
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins Regular',
                            ),
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
      context.read<PrayerTimesCubit>().fetchPrayerTimes(
            currentPosition.latitude!,
            currentPosition.longitude!,
            picked,
          );
    }
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

  String _formatPrayerTime(String time) {
    try {
      DateTime parsedTime = DateFormat("HH:mm").parse(time);
      return DateFormat("h:mm a").format(parsedTime);
    } catch (e) {
      return time;
    }
  }
}
