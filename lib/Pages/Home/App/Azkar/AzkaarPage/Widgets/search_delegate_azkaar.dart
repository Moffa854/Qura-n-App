import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app1/Core/Constant/color_app.dart';
import 'package:quraan_app1/Core/Constant/sizes_app.dart';
import 'package:quraan_app1/Core/Widget/create_slide_transation.dart';
import 'package:quraan_app1/Data/Models/Azkaar/main_azkaar_model.dart';
import 'package:quraan_app1/Pages/Home/App/Azkar/ContentAzkaar/Screens/content_azkaar.dart';
import 'package:quraan_app1/cubit/AzkaarCubit/azkaar_cubit.dart';
import 'stack_muslim_image.dart';

class SearchDelegateWidget2 extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isNotEmpty ? query = '' : close(context, true);
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final azkaarCubit = BlocProvider.of<AzkaarCubit>(context);
    final azkaarList = _getAzkaarList(azkaarCubit);

    // تصفية البيانات بناءً على الاستعلام
    final filteredResults = _filterAzkaarList(azkaarList);

    return filteredResults.isEmpty
        ? _buildEmptyResults()
        : _buildResultsList(filteredResults, context);
  }

  List<MainAzkaarModel> _getAzkaarList(AzkaarCubit azkaarCubit) {
    return azkaarCubit.state is AzkaarLoaded
        ? (azkaarCubit.state as AzkaarLoaded).azkaarList
        : <MainAzkaarModel>[];
  }

  List<MainAzkaarModel> _filterAzkaarList(List<MainAzkaarModel> azkaarList) {
    return azkaarList.where((azkaar) {
      return azkaar.category.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  Widget _buildEmptyResults() {
    return const Center(
      child: Text(
        'لا توجد سورة بهذا الإسم',
        style: TextStyle(
          color: ColorApp.purple,
          fontFamily: 'Lateef Regular',
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildResultsList(List<MainAzkaarModel> filteredResults, BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (BuildContext context, int index) {
          final azkaar = filteredResults[index];
          return _buildListItem(azkaar, context);
        },
      ),
    );
  }

  Widget _buildListItem(MainAzkaarModel azkaar, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          createSlideTransation(
            ContentAzkaar(
              title: azkaar.category,
              array: azkaar.arraye,
              id: azkaar.id,
            ),
            const Offset(1.0, 0.1),
          ),
        );
      },
      leading: StackMuslimImage(azk: azkaar),
      trailing: const Icon(
        Icons.arrow_right_alt_rounded,
        color: ColorApp.purple,
        size: 25,
      ),
      title: Text(
        azkaar.category,
        style: TextStyle(
          color: ColorApp.purple,
          fontFamily: 'Lateef Regular',
          fontSize: sizesApp(context, 24, 27, 30).toDouble(),
        ),
      ),
    );
  }
}
