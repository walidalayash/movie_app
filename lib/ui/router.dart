import 'package:auto_route/auto_route.dart';
import 'package:movieapp/ui/views/actor_view/actor_view.dart';
import 'package:movieapp/ui/views/actors_list/actors_list_view.dart';
import 'package:movieapp/ui/views/favorite_view/favorite_view.dart';
import 'package:movieapp/ui/views/home/home_view.dart';
import 'package:movieapp/ui/views/login_view/login_view.dart';
import 'package:movieapp/ui/views/movie_view/movie_view.dart';
import 'package:movieapp/ui/views/movies_list/movies_list_view.dart';
import 'package:movieapp/ui/views/profile_view/profile_view.dart';
import 'package:movieapp/ui/views/settings/settings_view.dart';
import 'package:movieapp/ui/views/sign_up/sign_up.dart';
import 'package:movieapp/ui/widgets/stateless/add_photos/add_photos.dart';

import 'views/main/main_view.dart';
import 'views/startup/start_up_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page', routes: <AutoRoute>[
  AutoRoute(page: CustomerMainView),
  AutoRoute(
    page: StartUpView,
  ),
  AutoRoute(page: CustomerMainView),
  AutoRoute(page: MoviesListView),
  AutoRoute(page: ActorsListView),
  AutoRoute(page: ActorView),
  AutoRoute(page: MovieView),
  AutoRoute(page: SettingsView),
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: ProfileView),
  AutoRoute(page: FavoriteView),
  AutoRoute(page: HomeScreen),
  AutoRoute(page: AddPhotos),
  AutoRoute(page: SignUp),
])
class $AppRouter {}
