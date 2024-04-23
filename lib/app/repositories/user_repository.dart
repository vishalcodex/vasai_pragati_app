import 'package:get/get.dart';
import 'package:vasai_pragati/app/models/profile_model.dart';
import 'package:vasai_pragati/app/services/auth_service.dart';

import '../models/api_response.dart';
import '../models/user_model.dart';
import '../providers/api_provider.dart';

class UserRepository {
  late ApiProvider apiProvider;

  UserRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> signUp(String phoneNo) async {
    return await apiProvider
        .makeAPICall("POST", "signup", {"phone": phoneNo}).then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> verifyOtp(creds) async {
    return await apiProvider
        .makeAPICall("POST", "verify-otp", creds)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> setVpin(String vpin) async {
    return await apiProvider
        .makeAPICall("POST", "set-vpin", {"vpin": vpin}).then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> setPassword(String password) async {
    return await apiProvider.makeAPICall(
        "POST", "set-password", {"password": password}).then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> login(creds) async {
    return await apiProvider.makeAPICall("POST", "login", creds).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data["user"]);
        user.token = value.data["token"];
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> forgotPassword(String email) async {
    return await apiProvider
        .makeAPICall("POST", "forgot-password", {"email": email}).then((value) {
      if (value.status == Status.COMPLETED) {
        // User user = User.fromJson(value.data["user"]);
        // user.token = value.data["token"];
        // value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchUserDetails() async {
    return await apiProvider
        .makeAPICall("GET", "user-details", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data[0]);
        user.token = Get.find<AuthService>().token;
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchProfileDetails() async {
    return await apiProvider.makeAPICall("GET", "profile", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        Profile user = Profile.fromJson(value.data);
        value.data = user;
      }
      return value;
    });
  }

  Future<ApiResponse> logout() async {
    return await apiProvider.makeAPICall("GET", "logout", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        User user = User.fromJson(value.data);
        value.data = user;
      }
      return value;
    });
  }
}
