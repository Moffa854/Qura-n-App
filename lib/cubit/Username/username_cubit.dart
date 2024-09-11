
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class UsernameCubit extends Cubit<String?> {
  UsernameCubit() : super(null) {
    loadUsername();
  }

  void loadUsername() {
    var box = Hive.box('userBox');
    emit(box.get('username'));
  }

  void saveUsername(String username) {
    var box = Hive.box('userBox');
    box.put('username', username);
    emit(username);
  }
}
