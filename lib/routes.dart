import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webui/helper/services/auth_service.dart';
import 'package:webui/views/user_screen.dart';
import 'package:webui/views/auth/forgot_password_screen.dart';
import 'package:webui/views/auth/locked_screen.dart';
import 'package:webui/views/auth/login_screen.dart';
import 'package:webui/views/auth/reset_password_screen.dart';
import 'package:webui/views/auth/sign_up_screen.dart';
import 'package:webui/views/datapi_screen.dart';
import 'package:webui/views/datare_screen.dart';
import 'package:webui/views/dataps_screen.dart';
import 'package:webui/views/inputan_screen.dart';
import 'package:webui/views/project_screen.dart';
import 'package:webui/views/salesorder_screen.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn
        ? null
        : const RouteSettings(name: '/auth/login');
  }
}

getPageRoute() {
  var routes = [
    GetPage(
        name: '/data-re',
        page: () => REScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/data-pi',
        page: () => PIScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/data-ps',
        page: () => PSScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/dashboard',
        page: () => ProjectScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/data-inputan',
        page: () => InputanScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/inputan-sales',
        page: () => SalesOrderScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/user', page: () => UserList(), middlewares: [AuthMiddleware()]),
    //------------------Authentication Screens------------------
    GetPage(name: '/auth/login', page: () => const LoginScreen()),
    GetPage(name: '/auth/sign_up', page: () => const SignUpScreen()),
    GetPage(
        name: '/auth/forgot_password',
        page: () => const ForgotPasswordScreen()),
    GetPage(
        name: '/auth/reset_password', page: () => const ResetPasswordScreen()),
    GetPage(name: '/auth/locked', page: () => const LockedScreen()),
  ];
  return routes
      .map((e) => GetPage(
          name: e.name,
          page: e.page,
          middlewares: e.middlewares,
          transition: Transition.noTransition))
      .toList();
}
