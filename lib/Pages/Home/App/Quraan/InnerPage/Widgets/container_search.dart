import 'package:flutter/material.dart';
import 'package:quraan_app1/Pages/Home/App/Quraan/InnerPage/Widgets/search_delegate.dart';

import 'build_search_container.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () => _showSearch(context),
        child: BuildSearchContainer(context: context),
      ),
    );
  }

  void _showSearch(BuildContext context) {
    showSearch(context: context, delegate: SearchDelegateWidget());
  }
}
