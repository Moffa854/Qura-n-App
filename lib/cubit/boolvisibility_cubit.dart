

import 'package:flutter_bloc/flutter_bloc.dart';

class BoolvisibilityCubit extends Cubit<bool> {
  BoolvisibilityCubit() : super(false);
  void taggel() {
    emit(!state);
  }
}
