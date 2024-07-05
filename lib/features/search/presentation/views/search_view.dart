import 'package:bookly/config/services_config.dart';
import 'package:bookly/features/search/presentation/view_models/controllers/search_data_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchDataCubit(ServicesConfig.searchRepo),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
