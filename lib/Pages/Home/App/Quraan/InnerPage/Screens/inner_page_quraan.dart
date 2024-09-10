import 'package:flutter/material.dart';

import '../Widgets/appbar_inner.dart';
import '../Widgets/body_inner.dart';

class InnerPageQuraan extends StatelessWidget {
  final String? userName;
  final GlobalKey<ScaffoldState>? scafoldKey;
  const InnerPageQuraan({super.key, this.userName, this.scafoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarInner(scafoldKey: scafoldKey),
          ///////////////////
          const BodyInner(),
        ],
      ),
    );
  }
}
