import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/core/services/db_service.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:bookly/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:bookly/features/home/domain/usecases/fetch_newest_books_usecase.dart';
import 'package:bookly/features/home/domain/usecases/fetch_recommendation_books_usecase.dart';
import 'package:bookly/features/home/presentation/controllers/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/controllers/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/controllers/recommendation_books_cubit/recommendation_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  // Services
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<ApiService>(
    ApiServiceImp(
      sl.get<Dio>(),
    ),
  );

  sl.registerSingleton<DBService<BookEntity>>(
    DBServiceImpl<BookEntity>(),
  );

  // Data Sources
  sl.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImpl(
      apiService: sl.get<ApiService>(),
    ),
  );

  sl.registerSingleton<HomeLocalDataSource>(
    HomeLocalDataSourceImpl(dbService: sl.get<DBService<BookEntity>>()),
  );

  // repos
  sl.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      homeLocalDataSource: sl.get<HomeLocalDataSource>(),
      homeRemoteDataSource: sl.get<HomeRemoteDataSource>(),
    ),
  );

  // Use Cases
  sl.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(
      homeRepo: sl.get<HomeRepo>(),
    ),
  );

  sl.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(
      homeRepo: sl.get<HomeRepo>(),
    ),
  );

  sl.registerSingleton<FetchRecommendationBooksUseCase>(
    FetchRecommendationBooksUseCase(
      homeRepo: sl.get<HomeRepo>(),
    ),
  );

  // Blocs & Cubits
  sl.registerFactory<FeaturedBooksCubit>(
    () => FeaturedBooksCubit(
      fetchFeaturedBooksUseCase: sl.get<FetchFeaturedBooksUseCase>(),
    ),
  );

  sl.registerFactory<NewestBooksCubit>(
    () => NewestBooksCubit(
      fetchNewestBooksUseCase: sl.get<FetchNewestBooksUseCase>(),
    ),
  );

  sl.registerFactory<RecommendationBooksCubit>(
    () => RecommendationBooksCubit(
      fetchRecommendationBooksUseCase: sl.get<FetchRecommendationBooksUseCase>(),
    ),
  );
}
