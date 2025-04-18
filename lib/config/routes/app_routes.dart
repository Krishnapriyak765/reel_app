import 'package:go_router/go_router.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/login/login_page.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_createAcc_page.dart';
import 'package:winngoo_reels_app/presentation/pages/competition/competition_page.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/home_screen_with_nav.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/upload_video_page.dart';
import 'package:winngoo_reels_app/presentation/pages/onboarding/Onboarding_Page1.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'HomeScreenWithNav',
      builder: (context, state) => HomeScreenWithNav(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => CreateAccountPage(),
    ),
    // GoRoute(
    //   path: '/HomeScreenWithNav',
    //   name: 'HomeScreenWithNav',
    //   builder: (context, state) => HomeScreenWithNav(),
    // ),
    GoRoute(
      path: '/UploadVideoPage',
      name: 'UploadVideoPage',
      builder: (context, state) => UploadVideoPage(),
    ),
    GoRoute(
      path: '/CompetitionPage',
      name: 'CompetitionPage',
      builder: (context, state) => CompetitionPage(),
    ),
  ],
);
