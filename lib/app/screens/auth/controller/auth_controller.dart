import 'dart:async';

import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class AuthController extends GetxController {
  Rx<User> user = User().obs;
  Rx<String> otp = "".obs;
  late UserRepository _userRepository;
  RxBool isLoading = false.obs;
  RxBool isLogin = true.obs;
  RxBool showPassword = false.obs;

  RxBool validEmail = false.obs;
  RxBool validPhone = false.obs;
  RxBool validVpin = false.obs;
  RxBool verifyVpin = false.obs;

  RxBool isError = false.obs;
  RxBool isVisible = false.obs;
  RxString errorMessage = "".obs;
  RxInt onStep = 1.obs;

  AuthController() {
    _userRepository = UserRepository();
  }

  var creds = {
    "email": "karomhatre@gmail.com",
    // "phone": "8097324074",
    // "vpin": "0125",
    "password": "p@ssw0rd"
  };
  @override
  void onInit() async {
    super.onInit();
    user.value = Get.find<AuthService>().user.value;
    creds["phone"] = user.value.registeredMobile ?? "";
    // creds["phone"] = "8097324074";
    // creds["phone"] = "7875002200";
    version = Get.find<AuthService>().version ?? "0";
  }

  late String? version = "";
  RxBool viaPassword = false.obs;

  //StepOne
  RxString text = "".obs;
  RxBool isOtpSent = false.obs;
  RxBool isResent = false.obs;

  late Timer timer;
  RxInt times = 30.obs;
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (times == 0) {
        timer.cancel();
        isResent.value = false;
      } else {
        times--;
      }
    });
  }

  void checkEmail() {
    validEmail.value = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(creds["email"]!);
    validEmail.refresh();
  }

  void checkPhone() {
    validPhone.value = creds["phone"]!.length == 10;
    validPhone.refresh();
  }

  void checkVpin() {
    validVpin.value = creds["vpin"]! == creds["confirm_vpin"];
    validVpin.refresh();
  }

  void getOtp() {
    isLoading.value = true;
    errorMessage.value = "";
    _userRepository.signUp(creds["phone"].toString()).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.toNamed(Routes.OTP_VERIFY);
      } else {
        errorMessage.value = value.message!;
        errorMessage.refresh();
      }
    });
  }

  void verification() {
    isLoading.value = true;
    errorMessage.value = "";
    _userRepository.verifyOtp(
        {"phone": creds["phone"], "otp": creds["otp"]}).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.find<AuthService>().saveUser(value.data);
        Get.toNamed(Routes.CONGRATS, arguments: {
          "title": "Verification Successful!",
          "message": "Your account has verified\n successfully.",
          "image": "assets/ui/complete/verification_complete.png"
        });
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAndToNamed(Routes.CREATE_PASSWORD);
        });
      } else {
        errorMessage.value = value.message!;
        errorMessage.refresh();
      }
    });
  }

  RxBool containsNameOrEmail = false.obs;
  RxBool hasLength8 = false.obs;
  RxBool containsSymbolOrNumber = false.obs;

  RxList<Map<String, dynamic>> passwordCriterias = <Map<String, dynamic>>[
    {"criteria": "Must not contain your name or email.", "isValid": true},
    {"criteria": "Must need At least 8 characters.", "isValid": false},
    {"criteria": "Contains a symbols or a number.", "isValid": false},
  ].obs;

  RxBool validPassword = false.obs;

  void checkPassword() {
    passwordCriterias[0]["isValid"] = true;

    passwordCriterias[1]["isValid"] = creds["password"].toString().length >= 8;

    passwordCriterias[2]["isValid"] =
        creds["password"].toString().contains(RegExp(r'[0-9]')) || //For numbers
            creds["password"].toString().contains(
                RegExp(r'[!@#$%^&*(),.?":{}|<>]')); //for special Characters

    validPassword.value = passwordCriterias[0]["isValid"] &
        passwordCriterias[1]["isValid"] &
        passwordCriterias[2]["isValid"];

    validPassword.refresh();
  }

  void createPassword() {
    isLoading.value = true;
    errorMessage.value = "";
    showPassword.value = false;
    _userRepository.setPassword(creds["password"].toString()).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.toNamed(Routes.CONGRATS, arguments: {
          "title": "Password Created Successful!",
          "image": "assets/ui/complete/vpin_complete.png",
          "message": "Please use your new password when\nLogin in."
        });
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAndToNamed(Routes.CREATE_VPIN);
        });
      } else {
        errorMessage.value = value.message!;
        errorMessage.refresh();
      }
    });
  }

  void createVpin() {
    isLoading.value = true;
    errorMessage.value = "";
    _userRepository.setVpin(creds["vpin"].toString()).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.toNamed(Routes.CONGRATS, arguments: {
          "title": "VPIN Created Successful!",
          "image": "assets/ui/complete/vpin_complete.png",
          "message":
              "VPIN has been submitted & saved,\nkindly login using VPIN for quick\naccess."
        });
        Future.delayed(const Duration(seconds: 2), () {
          Get.offAndToNamed(Routes.AUTH);
        });
      } else {}
    });
  }

  void forgotPasswordSent() {
    isLoading.value = true;
    errorMessage.value = "";
    _userRepository.forgotPassword(creds["email"].toString()).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.toNamed(Routes.CONGRATS, arguments: {
          "title": "Password Reset Successful!",
          "image": "assets/ui/complete/forgot_password_complete.png",
          "message":
              "Temporary password has been\nsent to your registered\nemail id."
        });
        Future.delayed(const Duration(seconds: 2), () {
          Get.back();
          Get.back();
        });
      } else {
        errorMessage.value = value.message!;
        errorMessage.refresh();
      }
    });
  }

  void loginViaVpin() {
    isLoading.value = true;
    errorMessage.value = "";
    _userRepository.login(
        {"phone": creds["phone"], "vpin": creds["confirm_pin"]}).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.find<AuthService>().saveUser(value.data).then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(
              Routes.HOME,
              predicate: (route) => Get.currentRoute == "/home",
            );
          });
        });
        Get.toNamed(Routes.CONGRATS, arguments: {
          "title": "Log in Successful!",
          "message": "You will be directed to the\nhomepage.",
          "image": "assets/ui/complete/login_complete.png"
        });
        verifyVpin.value = false;
      } else {
        errorMessage.value = value.message!;
        errorMessage.refresh();
      }
    });
  }

  Future signIn({bool? toRsd}) async {
    isLoading.value = true;
    errorMessage.value = "";
    // user.value.token = "Authorised";
    // p@ssw0rd
    _userRepository.login(
        {"phone": creds["phone"], "password": creds["password"]}).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.find<AuthService>().saveUser(value.data).then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(
              Routes.HOME,
              predicate: (route) => Get.currentRoute == "/home",
            );
          });
        });
        Get.toNamed(Routes.CONGRATS, arguments: {
          "title": "Log in Successful!",
          "message": "You will be directed to the\nhomepage.",
          "image": "assets/ui/complete/login_complete.png"
        });
        verifyVpin.value = false;
      } else {
        errorMessage.value = value.message ?? "Invalid Credentials !";
      }
    });
  }
}
