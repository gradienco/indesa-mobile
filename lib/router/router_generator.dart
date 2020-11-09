import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indesa_beta/animation/fade_transition.dart';
import 'package:indesa_beta/pages/dashboard/dashboard.dart';
import 'package:indesa_beta/pages/login/login_page.dart';
import 'package:indesa_beta/pages/splash/splash_page.dart';
import 'package:indesa_beta/pages/survey/survey_page.dart';

class RouterGenerator {

  /// -------------------
  /// ROUTING NAME LIST
  /// -------------------

  /// Splash Routing
  static const routeSplash = "/";

  /// Login Routing
  static const routeLogin = "/login";

  /// Dashboard Routing
  static const routeDashboard = "/dashboard";

  /// Survey Routing
  static const routeSurvey = "/survey";

  /// Results Routing
  static const routeResult = "/result";

  /// Results Routing
  static const routeProfile = "/profile";

  /// Initialize route
  static Route<dynamic> generate(RouteSettings settings) {
    /// Declaring argument route
    final args = settings.arguments;

    /// Make conditions to find correct route
    switch(settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => Splash());
      case routeLogin:
        return FadeRoute(page: LoginPage());
      case routeDashboard:
        return FadeRoute(page: Dashboard());
      case routeSurvey:
        return FadeRoute(page: SurveyPage());

      // case routeResult:
      //   if(args is int) {
      //     return MaterialPageRoute(
      //       builder: (_) => ResultPage(totalScore : args)
      //     );
      //   }

    }

    return null;
  }
}