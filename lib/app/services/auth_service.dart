import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/user_model.dart';

class AuthService extends GetxService {
  late Rx<User> user = User().obs;
  late GetStorage _box;
  late bool isRegistered = false;
  late bool showOnboarding = true;
  late String? token = "";
  late String? version = "";

  AuthService() {
    _box = GetStorage();
  }

  Future<AuthService> init() async {
    // await _box.write('isRegistered', true);
    // token = await _box.read("token");
    showOnboarding = await _box.read('showOnboarding') ?? true;
    isRegistered = await _box.read('isRegistered') ?? false;

    version = await PackageInfo.fromPlatform().then((value) {
      return value.version;
    });
    await getCurrentUser();
    return this;
  }

  setOnBoarding(bool toRegister) async {
    showOnboarding = false;
    await _box.write('showOnboarding', false);
  }

  Future getCurrentUser() async {
    var u0 = await _box.read("current_user");
    user.value = u0 == null ? User() : User.fromJson(u0);
  }

  Future removeCurrentUser() async {
    user.value = User();
    await _box.remove('current_user');
    await _box.remove("token");
  }

  Future saveUser(User value) async {
    await _box.write("token", value.token);
    await _box.write('isRegistered', true);
    await _box.write('phone', value.registeredMobile);
    user.value = value;
    token = value.token;
    await _box.write('current_user', user.value.toJson());
  }

  bool get isRegistering => isRegistered;
}
