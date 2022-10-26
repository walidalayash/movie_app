// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../core/models/actor/actor.dart' as _i16;
import '../core/models/movie/movie.dart' as _i17;
import 'views/actor_view/actor_view.dart' as _i5;
import 'views/actors_list/actors_list_view.dart' as _i4;
import 'views/favorite_view/favorite_view.dart' as _i10;
import 'views/home/home_view.dart' as _i11;
import 'views/login_view/login_view.dart' as _i8;
import 'views/main/main_view.dart' as _i1;
import 'views/movie_view/movie_view.dart' as _i6;
import 'views/movies_list/movies_list_view.dart' as _i3;
import 'views/profile_view/profile_view.dart' as _i9;
import 'views/settings/settings_view.dart' as _i7;
import 'views/sign_up/sign_up.dart' as _i13;
import 'views/startup/start_up_view.dart' as _i2;
import 'widgets/stateless/add_photos/add_photos.dart' as _i12;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    CustomerMainViewRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.CustomerMainView());
    },
    StartUpViewRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.StartUpView());
    },
    MoviesListViewRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.MoviesListView());
    },
    ActorsListViewRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.ActorsListView());
    },
    ActorViewRoute.name: (routeData) {
      final args = routeData.argsAs<ActorViewRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.ActorView(args.actor));
    },
    MovieViewRoute.name: (routeData) {
      final args = routeData.argsAs<MovieViewRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.MovieView(args.movie));
    },
    SettingsViewRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.SettingsView());
    },
    LoginScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.LoginScreen());
    },
    ProfileViewRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfileView());
    },
    FavoriteViewRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.FavoriteView());
    },
    HomeScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.HomeScreen());
    },
    AddPhotosRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AddPhotos());
    },
    SignUpRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SignUp());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(CustomerMainViewRoute.name,
            path: '/customer-main-view'),
        _i14.RouteConfig(StartUpViewRoute.name, path: '/start-up-view'),
        _i14.RouteConfig(CustomerMainViewRoute.name,
            path: '/customer-main-view'),
        _i14.RouteConfig(MoviesListViewRoute.name, path: '/movies-list-view'),
        _i14.RouteConfig(ActorsListViewRoute.name, path: '/actors-list-view'),
        _i14.RouteConfig(ActorViewRoute.name, path: '/actor-view'),
        _i14.RouteConfig(MovieViewRoute.name, path: '/movie-view'),
        _i14.RouteConfig(SettingsViewRoute.name, path: '/settings-view'),
        _i14.RouteConfig(LoginScreenRoute.name, path: '/'),
        _i14.RouteConfig(ProfileViewRoute.name, path: '/profile-view'),
        _i14.RouteConfig(FavoriteViewRoute.name, path: '/favorite-view'),
        _i14.RouteConfig(HomeScreenRoute.name, path: '/home-screen'),
        _i14.RouteConfig(AddPhotosRoute.name, path: '/add-photos'),
        _i14.RouteConfig(SignUpRoute.name, path: '/sign-up')
      ];
}

/// generated route for
/// [_i1.CustomerMainView]
class CustomerMainViewRoute extends _i14.PageRouteInfo<void> {
  const CustomerMainViewRoute()
      : super(CustomerMainViewRoute.name, path: '/customer-main-view');

  static const String name = 'CustomerMainViewRoute';
}

/// generated route for
/// [_i2.StartUpView]
class StartUpViewRoute extends _i14.PageRouteInfo<void> {
  const StartUpViewRoute()
      : super(StartUpViewRoute.name, path: '/start-up-view');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i3.MoviesListView]
class MoviesListViewRoute extends _i14.PageRouteInfo<void> {
  const MoviesListViewRoute()
      : super(MoviesListViewRoute.name, path: '/movies-list-view');

  static const String name = 'MoviesListViewRoute';
}

/// generated route for
/// [_i4.ActorsListView]
class ActorsListViewRoute extends _i14.PageRouteInfo<void> {
  const ActorsListViewRoute()
      : super(ActorsListViewRoute.name, path: '/actors-list-view');

  static const String name = 'ActorsListViewRoute';
}

/// generated route for
/// [_i5.ActorView]
class ActorViewRoute extends _i14.PageRouteInfo<ActorViewRouteArgs> {
  ActorViewRoute({required _i16.Actor actor})
      : super(ActorViewRoute.name,
            path: '/actor-view', args: ActorViewRouteArgs(actor: actor));

  static const String name = 'ActorViewRoute';
}

class ActorViewRouteArgs {
  const ActorViewRouteArgs({required this.actor});

  final _i16.Actor actor;

  @override
  String toString() {
    return 'ActorViewRouteArgs{actor: $actor}';
  }
}

/// generated route for
/// [_i6.MovieView]
class MovieViewRoute extends _i14.PageRouteInfo<MovieViewRouteArgs> {
  MovieViewRoute({required _i17.Movie movie})
      : super(MovieViewRoute.name,
            path: '/movie-view', args: MovieViewRouteArgs(movie: movie));

  static const String name = 'MovieViewRoute';
}

class MovieViewRouteArgs {
  const MovieViewRouteArgs({required this.movie});

  final _i17.Movie movie;

  @override
  String toString() {
    return 'MovieViewRouteArgs{movie: $movie}';
  }
}

/// generated route for
/// [_i7.SettingsView]
class SettingsViewRoute extends _i14.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(SettingsViewRoute.name, path: '/settings-view');

  static const String name = 'SettingsViewRoute';
}

/// generated route for
/// [_i8.LoginScreen]
class LoginScreenRoute extends _i14.PageRouteInfo<void> {
  const LoginScreenRoute() : super(LoginScreenRoute.name, path: '/');

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i9.ProfileView]
class ProfileViewRoute extends _i14.PageRouteInfo<void> {
  const ProfileViewRoute()
      : super(ProfileViewRoute.name, path: '/profile-view');

  static const String name = 'ProfileViewRoute';
}

/// generated route for
/// [_i10.FavoriteView]
class FavoriteViewRoute extends _i14.PageRouteInfo<void> {
  const FavoriteViewRoute()
      : super(FavoriteViewRoute.name, path: '/favorite-view');

  static const String name = 'FavoriteViewRoute';
}

/// generated route for
/// [_i11.HomeScreen]
class HomeScreenRoute extends _i14.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home-screen');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i12.AddPhotos]
class AddPhotosRoute extends _i14.PageRouteInfo<void> {
  const AddPhotosRoute() : super(AddPhotosRoute.name, path: '/add-photos');

  static const String name = 'AddPhotosRoute';
}

/// generated route for
/// [_i13.SignUp]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}
