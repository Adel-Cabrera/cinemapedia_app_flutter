import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:cinemapedia_app/presentation/screens/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return (HomeScreen(childView: child));
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id';
                return MovieScreen(
                  movieId: int.parse(movieId),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesView();
          },
        )
      ],
    ),
  ],
);


// final appRouter = GoRouter(initialLocation: '/', routes: [
//   GoRoute(
//     path: '/',
//     name: HomeScreen.name,
//     builder: (context, state) => const HomeScreen(childView: FavoritesView()),
//     routes: [
//       GoRoute(
//         path: 'movie/:id',
//         name: MovieScreen.name,
//         builder: (context, state) {
//           final movieId = state.pathParameters['id'] ?? 'no-id';
//           return MovieScreen(
//             movieId: int.parse(movieId),
//           );
//         },
//       ),
//     ],
//   ),
//   //           GoRoute(
//   //   path: '/movie/:id', // CON SLASH
//   //   name: MovieScreen.name,
//   //   builder: (context, state) {
//   //     final movieId = state.pathParameters['id'] ?? 'no-id';
//   //     return MovieScreen(
//   //       movieId: movieId,
//   //     );
//   //   },
//   // ),
// ]);


