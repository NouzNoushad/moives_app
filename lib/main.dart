import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/data/bloc/bloc_widget.dart';
import 'package:movies_app/presentation/movies_details.dart';
import 'package:movies_app/presentation/movies_home.dart';
import 'package:movies_app/utils/colors.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
                backgroundColor: backgroundColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: transparentColor,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.light,
                ))),
      ),
    );
  }

  late final GoRouter router =
      GoRouter(initialLocation: '/', navigatorKey: navigatorState, routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const MoviesHome();
        }),
    GoRoute(
        path: '/details',
        builder: (context, state) {
          return MoviesDetails(
            movie: state.extra as dynamic,
          );
        }),
  ]);
}
