part of 'app_router_imports.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  final routeName = settings.name;
  sl<SharedData>().routeName = routeName ?? '';

  showLog(routeName, 'routeName');

  switch (routeName) {
    case '/':
    case '/home':
      return PageRoute(
        builder:
            (_) => BlocProvider(
              create: (context) => sl<HomeCubit>(),
              child: const HomeScreen(),
            ),
      );
    default:
      return PageRoute(
        builder:
            (_) => Scaffold(
              body: Center(
                child: Text('${AppStrings.noRouteDefinedFor} $routeName'),
              ),
            ),
      );
  }
}
