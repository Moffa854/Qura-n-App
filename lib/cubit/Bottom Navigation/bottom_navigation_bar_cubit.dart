import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigtionBarItem { azkaar, quraan, prayer,qiblah }

class BottomNavigationBarCubit extends Cubit<NavigtionBarItem> {
  BottomNavigationBarCubit(
      {NavigtionBarItem initialIndex = NavigtionBarItem.quraan})
      : super(initialIndex); // تأكد أن هنا هو الأذكار
  void updateIndex(NavigtionBarItem item) {
    emit(item);
  }
}
