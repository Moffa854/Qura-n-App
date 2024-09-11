import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/Constant/color_app.dart';
import '../../../../../../Core/Constant/sizes_app.dart';
import '../../../../../../cubit/Username/username_cubit.dart';

class TextUser extends StatelessWidget {
  const TextUser({
    super.key,
    required Animation<double> animation,
  }) : _animation = animation;

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernameCubit, String?>(
      builder: (context, username) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Text(
                '$username',
                style: TextStyle(
                  color: ColorApp.purple,
                  fontSize: sizesApp(context, 18, 24, 30).toDouble(),
                  fontFamily: 'Poppins Bold',
                ),
              ),
            );
          },
        );
      },
    );
  }
}