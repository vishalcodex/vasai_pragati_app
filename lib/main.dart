import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
import '/common/theme.dart';
import '../app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/providers/api_provider.dart';
import 'app/routes/app_routes.dart';
import 'app/services/auth_service.dart';

Future initServices() async {
  Get.log('starting services ...');
  await GetStorage.init();
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => ApiProvider().init()).then((value) {
    Get.find<AuthService>().getCurrentUser();
  });
  Get.log('All services started...');
}

void main() async {
  //ONE SIGNAL
  //Remove this method to stop OneSignal Debugging
  // if (kDebugMode) {
  //   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // }
  // OneSignal.initialize("<YOUR APP ID HERE>");
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  // OneSignal.Notifications.requestPermission(true);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
  await initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionConfig = SessionConfig(
        invalidateSessionForAppLostFocus: const Duration(seconds: 30),
        invalidateSessionForUserInactivity: const Duration(seconds: 30));
    sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      if (!kDebugMode) {
        if (timeoutEvent == SessionTimeoutState.userInactivityTimeout) {
          // handle user  inactive timeout
          if (![
            Routes.AUTH,
            Routes.OTP_VERIFY,
            Routes.CREATE_PASSWORD,
            Routes.CREATE_VPIN,
            Routes.CONGRATS,
            Routes.SIGN_IN
          ].contains(Get.currentRoute)) {
            Get.offAllNamed(
              Routes.HOME,
              predicate: (route) => Get.currentRoute == Routes.HOME,
            );
            Get.offAndToNamed(Routes.AUTH);
          }
        } else if (timeoutEvent == SessionTimeoutState.appFocusTimeout) {
          // handle user  app lost focus timeout
          if (![
            Routes.AUTH,
            Routes.OTP_VERIFY,
            Routes.CREATE_PASSWORD,
            Routes.CREATE_VPIN,
            Routes.CONGRATS,
            Routes.SIGN_IN
          ].contains(Get.currentRoute)) {
            Get.offAllNamed(
              Routes.HOME,
              predicate: (route) => Get.currentRoute == Routes.HOME,
            );
            Get.offAndToNamed(Routes.AUTH);
          }
        }
      }
    });
    return SessionTimeoutManager(
      sessionConfig: sessionConfig,
      child: GetMaterialApp(
        title: "Vasai Pragati Co-op Credit Society",
        initialRoute: AppPages.INITIAL,
        onReady: () async {},
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        themeMode: getThemeMode(),
        theme: getThemeData(),
      ),
    );
  }
}
