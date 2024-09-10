import 'package:flutter/material.dart';

import 'text_user.dart';

class TextNameUser extends StatefulWidget {
  const TextNameUser({
    super.key,
  });

  @override
  State<TextNameUser> createState() => _TextNameUserState();
}

class _TextNameUserState extends State<TextNameUser>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextUser(animation: _animation);
  }
}
