import 'package:go_router/go_router.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/login/login_page.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_createAcc_page.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_payment_page.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_personalifo_page.dart';
import 'package:winngoo_reels_app/presentation/pages/competition/competition_page.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/competition_rules.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/home_screen_with_nav.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/profile_screen.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/refferal_screen.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/upload_video.dart';
import 'package:winngoo_reels_app/presentation/pages/onboarding/Onboarding_Page1.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'OnboardingPage',
      builder: (context, state) => OnboardingPage(),
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
    GoRoute(
      path: '/homewithnav',
      name: 'homewithnav',
      builder: (context, state) => HomeScreenWithNav(),
    ),
    GoRoute(
      path: '/uploadvideo',
      name: 'UploadVideoPage',
      builder: (context, state) => UploadVideoScreen(),
    ),
    GoRoute(
      path: '/competition',
      name: 'CompetitionPage',
      builder: (context, state) => CompetitionPage(),
    ),
    GoRoute(
      path: '/profile',
      name: 'Profile',
      builder: (context, state) => MembershipInfoPage(),
    ),
    GoRoute(
      path: '/refferal',
      name: 'RefferalPage',
      builder: (context, state) => ReferralHistoryPage(),
    ),
    GoRoute(
      path: '/createaccount',
      name: 'CreateAccount',
      builder: (context, state) => CreateAccountPage(),
    ),
    GoRoute(
      path: '/payment',
      name: 'PaymentDetailsPage',
      builder: (context, state) => PaymentDetailsPage(newsignupData: {}),
    ),
    GoRoute(
      path: '/regpersnalinfo',
      name: 'RegPersonalInfo',
      builder: (context, state) => PersonalInfoForm(signupData: {}),
    ),
    GoRoute(
      path: '/competionRule',
      name: 'competionRule',
      builder: (context, state) => CompetitionRulesPage(),
    ),
  ],
);
