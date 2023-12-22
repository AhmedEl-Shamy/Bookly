import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentaion/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/book_details_view.dart';

class AppRouter {
  static const String homeViewRoute = '/homeView';
  static const String bookDetails = '/bookDetails';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetails,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
