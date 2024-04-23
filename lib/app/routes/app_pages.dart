import '../screens/deposit/views/multiple_accounts_screen.dart';
import '../screens/home/views/emi_calculator_screen.dart';
import '../screens/home/views/fd_calculator_screen.dart';
import '../screens/home/views/my_profile.dart';
import '../components/congrats_screen.dart';
import '../screens/auth/views/create_password_screen.dart';
import '../screens/auth/views/create_vpin_screen.dart';
import '../screens/auth/views/forgot_password_screen.dart';
import '../screens/auth/views/get_started.dart';
import '../screens/auth/views/sign_in_view.dart';

import 'package:get/get.dart';
import '../components/splash.dart';
import '../middlewares/onboarding_middleware.dart';
import '../screens/auth/binding/auth_binding.dart';
import '../screens/auth/views/auth_screen.dart';
import '../screens/auth/views/verify_otp_screen.dart';
import '../screens/deposit/binding/deposit_binding.dart';
import '../screens/deposit/views/deposit_details_screen.dart';
import '../screens/deposit/views/deposit_screen.dart';
import '../screens/events/binding/events_binding.dart';
import '../screens/events/views/events_details_screen.dart';
import '../screens/events/views/events_screen.dart';
import '../screens/home/binding/home_binding.dart';
import '../screens/home/views/about_us_screen.dart';
import '../screens/home/views/advertisement_screen.dart';
import '../screens/home/views/contact_us_screen.dart';
import '../screens/home/views/dashboard_screen.dart';
import '../screens/statement/binding/statement_binding.dart';
import '../screens/statement/views/statmeent_screen.dart';
import '../screens/interest_certificates/binding/interests_binding.dart';
import '../screens/interest_certificates/views/interests_screen.dart';
import '../screens/loans/binding/loan_binding.dart';
import '../screens/loans/views/loan_details_screen.dart';
import '../screens/loans/views/loan_screen.dart';
import '../screens/lockers/binding/lockers_binding.dart';
import '../screens/lockers/views/locker_details_screen.dart';
import '../screens/lockers/views/locker_screen.dart';
import '../screens/onboarding/binding/onboarding_binding.dart';
import '../screens/onboarding/views/onboarding_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      // binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.GET_STARTED,
      page: () => GetStarted(),
      binding: OnboardBinding(),
      // middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoardingScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(),
      binding: HomeBinding(),
      middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.OTP_VERIFY,
      page: () => VerifyOTOScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MY_PROFILE,
      page: () => MyProfileScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ADVERTISEMENT,
      page: () => AdvertisementScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.STATEMENT,
      page: () => StatementScreen(),
      binding: StatementBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.DEPOSIT,
      page: () => DepositScreen(),
      binding: DepositBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.MULTIPLE_AACOUNTS,
      page: () => MultipleAccountsScreen(),
      binding: DepositBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.DEPOSIT_DETAILS,
      page: () => DepositDetailsScreen(),
      binding: DepositBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.LOAN,
      page: () => LoanScreen(),
      binding: LoanBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.LOAN_DETAILS,
      page: () => LoanDetailsScreen(),
      binding: LoanBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CONGRATS,
      page: () => CongratsScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CREATE_VPIN,
      page: () => CreateVpinScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CREATE_PASSWORD,
      page: () => CreatePasswordScreen(),
      binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.ABOUT_US,
      page: () => AboutUsScreen(),
      // binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.CONTACT_US,
      page: () => ContactUsScreen(),
      // binding: AuthBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.INTERESTS_CERTIFICATES,
      page: () => InterestsScreen(),
      binding: InterestsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.EVENTS,
      page: () => EventsScreen(),
      binding: EventsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.EVENTS_DETAILS,
      page: () => EventsDetails(),
      binding: EventsBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.LOCKER,
      page: () => LockerScreen(),
      binding: LockerBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.LOCKER_DETAILS,
      page: () => LockerDetailsScreen(),
      binding: LockerBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.EMI_CALCI,
      page: () => EMICalculatorScreen(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
    GetPage(
      name: Routes.FD_CALCI,
      page: () => FixedDepositCalculator(),
      binding: HomeBinding(),
      // middlewares: [OnBoardingMiddleWare()],
    ),
  ];
}
