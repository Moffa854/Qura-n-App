import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app1/Core/Constant/color_app.dart';
import 'package:quraan_app1/Core/Constant/sizes_app.dart';
import 'package:quraan_app1/Core/Widget/create_slide_transation.dart';
import 'package:quraan_app1/Data/Models/Quraan/main_quran_model.dart';
import 'package:quraan_app1/Pages/Home/App/Quraan/AyahPage/Screens/ayah_page.dart';

import '../../../../../../cubit/QuraanCubit/quraan_cubit.dart';

class SearchDelegateWidget extends SearchDelegate {
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
    final quranCubit = BlocProvider.of<QuraanCubit>(context);
    final quranList = _getQuranList(quranCubit);

    final filteredResults = _filterQuranList(quranList);

    return filteredResults.isEmpty
        ? _buildEmptyResults()
        : _buildResultsList(filteredResults, context);
  }

  List<MainQuranModel> _getQuranList(QuraanCubit quranCubit) {
    return quranCubit.state is QuraanLoaded
        ? (quranCubit.state as QuraanLoaded).quranList
        : <MainQuranModel>[];
  }

  List<MainQuranModel> _filterQuranList(List<MainQuranModel> quranList) {
    return quranList.where((quran) {
      return quran.name.toLowerCase().contains(query.toLowerCase()) ||
          quran.name_translation.toLowerCase().contains(query.toLowerCase());
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

  Widget _buildResultsList(
      List<MainQuranModel> filteredResults, BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (BuildContext context, int index) {
          final quran = filteredResults[index];
          return _buildListItem(quran, context);
        },
      ),
    );
  }

  Widget _buildListItem(MainQuranModel quran, BuildContext context) {
    return ListTile(
      title: Text(
        quran.name,
        style: const TextStyle(
          color: ColorApp.purple,
          fontFamily: 'Lateef Regular',
          fontSize: 24,
        ),
      ),
      trailing: Text(
        quran.name_translation,
        style: TextStyle(
          color: ColorApp.purple,
          fontFamily: 'Poppins Bold',
          fontSize: sizesApp(context, 16, 18, 20).toDouble(),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          createSlideTransation(
            AyahPage(
              nameTranslation: quran.name_translation,
              id: quran.id,
              nameEn: quran.name_en,
              array: quran.array,
            ),
            const Offset(1.0, 0.1),
          ),
        );
      },
    );
  }
}
