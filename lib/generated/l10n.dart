// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `مرحباً {firstName}`
  String pageHomeTitle(Object firstName) {
    return Intl.message(
      'مرحباً $firstName',
      name: 'pageHomeTitle',
      desc: 'هذا فقط مجرد مثال لشرح قدرة الترجمة على وضع نصوصو بديلة ',
      args: [firstName],
    );
  }

  /// `الاخبارالاخبار`
  String get main_view_home {
    return Intl.message(
      'الاخبارالاخبار',
      name: 'main_view_home',
      desc: '',
      args: [],
    );
  }

  //
  /// `الرئيسية`
  String get home_view {
    return Intl.message(
      'الرئيسية',
      name: 'home_view',
      desc: '',
      args: [],
    );
  }

  /// `الافلام`
  String get main_view_movies {
    return Intl.message(
      'الافلام',
      name: 'main_view_movies',
      desc: '',
      args: [],
    );
  }

  /// `الفنانيين`
  String get main_view_actors {
    return Intl.message(
      'الفنانيين',
      name: 'main_view_actors',
      desc: '',
      args: [],
    );
  }

  /// `الفنانيين`
  String get main_view_profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'main_view_profile',
      desc: '',
      args: [],
    );
  }

  /// `عن التطبيق`
  String get about_app {
    return Intl.message(
      'عن التطبيق',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `الضبط`
  String get settings {
    return Intl.message(
      'الضبط',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `النسخة`
  String get version {
    return Intl.message(
      'النسخة',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `عن المبرمجين`
  String get about_developers {
    return Intl.message(
      'عن المبرمجين',
      name: 'about_developers',
      desc: '',
      args: [],
    );
  }

  /// `شركة سديم التقنية`
  String get sadeem_tech_co {
    return Intl.message(
      'شركة سديم التقنية',
      name: 'sadeem_tech_co',
      desc: '',
      args: [],
    );
  }

  /// `قائمة فارغة`
  String get empty_list {
    return Intl.message(
      'قائمة فارغة',
      name: 'empty_list',
      desc: '',
      args: [],
    );
  }

  /// `المحاولة مرة أخرى`
  String get exception_indicator_try_again {
    return Intl.message(
      'المحاولة مرة أخرى',
      name: 'exception_indicator_try_again',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأاثناء جلب البيانات`
  String get generic_error_indicator_error_while_fetching_data {
    return Intl.message(
      'حدث خطأاثناء جلب البيانات',
      name: 'generic_error_indicator_error_while_fetching_data',
      desc: '',
      args: [],
    );
  }

  /// `الاشعارات`
  String get settings_view_notification {
    return Intl.message(
      'الاشعارات',
      name: 'settings_view_notification',
      desc: '',
      args: [],
    );
  }

  /// `عن التطبيق`
  String get settings_view_about {
    return Intl.message(
      'عن التطبيق',
      name: 'settings_view_about',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال`
  String get no_connection_indicator_no_connection {
    return Intl.message(
      'لا يوجد اتصال',
      name: 'no_connection_indicator_no_connection',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء المحاولة في وقت لاحق`
  String get no_connection_indicator_try_again_later {
    return Intl.message(
      'الرجاء المحاولة في وقت لاحق',
      name: 'no_connection_indicator_try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `لنتمكن من رؤية محتويات هذه الصفحة يتوجب عليك الدخول اولاً`
  String get not_authorized_indicator_you_need_to_login_to_see_this_page {
    return Intl.message(
      'لنتمكن من رؤية محتويات هذه الصفحة يتوجب عليك الدخول اولاً',
      name: 'not_authorized_indicator_you_need_to_login_to_see_this_page',
      desc: '',
      args: [],
    );
  }

  /// `التسجيل/ الدخول`
  String get not_authorized_indicator_login_register {
    return Intl.message(
      'التسجيل/ الدخول',
      name: 'not_authorized_indicator_login_register',
      desc: '',
      args: [],
    );
  }

//my add
  String get email {
    return Intl.message(
      'البريد الألكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  String get name {
    return Intl.message(
      'الأسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  String get age {
    return Intl.message(
      'العمر',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  String get favorite_categories {
    return Intl.message(
      'تصنيفات المفضل',
      name: 'favorite_categories',
      desc: '',
      args: [],
    );
  }

  String get password {
    return Intl.message(
      'الرمز السري',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  String get already_have_an_account {
    return Intl.message(
      'بالفعل لدي حساب',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  String get sign_Up {
    return Intl.message(
      'تسجيل',
      name: 'sign_Up',
      desc: '',
      args: [],
    );
  }

  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  String get skip {
    return Intl.message(
      'تخطي',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  String get new_rental {
    return Intl.message(
      'إيجار جديد',
      name: 'new_rental',
      desc: '',
      args: [],
    );
  }

  String get trending_actors_on_this_week {
    return Intl.message(
      'ممثلين اكثر شعبية',
      name: 'trending_actors_on_this_week',
      desc: '',
      args: [],
    );
  }

  String get warning {
    return Intl.message(
      'تحذير',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  String get warning_message {
    return Intl.message(
      'هناك معلومات فارغة',
      name: 'warning_message',
      desc: '',
      args: [],
    );
  }

  String get ok {
    return Intl.message(
      'موافق',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  String get born {
    return Intl.message(
      'مكان الولادة',
      name: 'born',
      desc: '',
      args: [],
    );
  }

  String get movies {
    return Intl.message(
      'الأفلام',
      name: 'movies',
      desc: '',
      args: [],
    );
  }

  String get favorite {
    return Intl.message(
      'المفضل',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  String get overview {
    return Intl.message(
      'القصة',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  String get release_date {
    return Intl.message(
      'يوم الاصدار',
      name: 'release_date',
      desc: '',
      args: [],
    );
  }

  String get run_time {
    return Intl.message(
      'مدة العرض',
      name: 'run_time',
      desc: '',
      args: [],
    );
  }

  String get box_office {
    return Intl.message(
      'شباك التذاكر',
      name: 'box_office',
      desc: '',
      args: [],
    );
  }

  String get cast {
    return Intl.message(
      'فريق التمثيل',
      name: 'cast',
      desc: '',
      args: [],
    );
  }

  String get recommended_movie {
    return Intl.message(
      'افلام مقترح',
      name: 'recommended_movie',
      desc: '',
      args: [],
    );
  }

  String get write_your_comment_here {
    return Intl.message(
      'اكتب رايك',
      name: 'write_your_comment_here',
      desc: '',
      args: [],
    );
  }

  String get comment {
    return Intl.message(
      'تعليق',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  String get add_your_rating {
    return Intl.message(
      'أضف تقييمك',
      name: 'add_your_rating',
      desc: '',
      args: [],
    );
  }

  String get add_comment {
    return Intl.message(
      'أضف التعليق',
      name: 'add_comment',
      desc: '',
      args: [],
    );
  }

  String get show_other_comments {
    return Intl.message(
      'أظهر التعليقات الأخرى',
      name: 'show_other_comments',
      desc: '',
      args: [],
    );
  }

  String get show_about {
    return Intl.message(
      'هل تحب مشاهدة الافلام؟ فقط باستخدام هاتفك الذكي واتصالك بالإنترنت ، يمكنك القيام بذلك. هناك الآلاف من الأفلام والبرامج التلفزيونية التي يمكنك العثور عليها على الويب ، ولكن من الصعب العثور على نظام بث موثوق به لا يقصفك بإعلانات أو روابط ضارة. لذا ، فإن أفضل ما يمكنك فعله هو استئجار فيلم حيث يمكنك اصطحاب جميع أفلامك المفضلة متى وأينما كنت.',
      name: 'show_about',
      desc: '',
      args: [],
    );
  }

  String get logout {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
