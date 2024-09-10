abstract class PrayerTimesState {}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesLoaded extends PrayerTimesState {
  final Map<String, dynamic> prayerTimes;
  final DateTime selectedDate;

  PrayerTimesLoaded(this.prayerTimes, this.selectedDate);
}

class PrayerTimesError extends PrayerTimesState {
  final String message;

  PrayerTimesError(this.message);
}
