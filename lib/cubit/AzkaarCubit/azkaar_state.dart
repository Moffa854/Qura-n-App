part of 'azkaar_cubit.dart';

@immutable
sealed class AzkaarState {}

final class AzkaarInitial extends AzkaarState {}

class AzkaarLoaded extends AzkaarState {
 final List<MainAzkaarModel> azkaarList ;

  AzkaarLoaded( this.azkaarList);
}
