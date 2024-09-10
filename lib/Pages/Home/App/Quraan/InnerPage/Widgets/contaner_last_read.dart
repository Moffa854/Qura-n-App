import 'package:flutter/material.dart';

import 'container_slidetransition.dart';

class ContanerLastRead extends StatefulWidget {
  const ContanerLastRead({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContanerLastReadState createState() => _ContanerLastReadState();
}

class _ContanerLastReadState extends State<ContanerLastRead>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerSlideTransition(offsetAnimation: _offsetAnimation);
  }
}
