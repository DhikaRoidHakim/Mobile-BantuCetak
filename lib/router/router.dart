
import 'package:go_router/go_router.dart';
import '../views/splash_page.dart';
import '../views/search_page.dart';
import '../views/detail_page.dart';

final goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DetailPage(nodokumen: id);
      },
    ),
  ],
);
