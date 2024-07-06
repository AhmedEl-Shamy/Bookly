import 'package:bookly/core/utlis/dependency_injection.dart';
import 'package:bookly/features/search/presentation/controllers/search_data_cubit.dart';
import 'package:bookly/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<SearchDataCubit>(),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
