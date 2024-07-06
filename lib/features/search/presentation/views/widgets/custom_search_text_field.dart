
import 'package:bookly/features/search/presentation/controllers/search_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utlis/assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: BlocProvider.of<SearchDataCubit>(context).controller,
      keyboardType: TextInputType.text,
      onSubmitted: (value) => BlocProvider.of<SearchDataCubit>(context).fetchSearchData(),
      decoration: InputDecoration(
        enabledBorder: customTextFieldBorder(),
        focusedBorder: customTextFieldBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () => BlocProvider.of<SearchDataCubit>(context).fetchSearchData(),
          icon: Image.asset(
            AssetsData.searchIcon,
            height: 24,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder customTextFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.75),
        ),
      );
  }
}