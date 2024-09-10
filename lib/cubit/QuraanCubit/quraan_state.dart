part of 'quraan_cubit.dart';

@immutable
sealed class QuraanState {}

final class QuraanInitial extends QuraanState {}

class QuraanLoaded extends QuraanState {
 final List<MainQuranModel> quranList;

  QuraanLoaded( this.quranList);
}
