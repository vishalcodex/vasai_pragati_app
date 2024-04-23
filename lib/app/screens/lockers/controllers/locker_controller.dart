import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vasai_pragati/app/routes/app_routes.dart';
import '../../../models/locker_model.dart';
import '../../../repositories/accounts_repository.dart';

class LockerController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxString quote = "".obs;
  // WidgetsToImageController widgetsToImageController =
  //     WidgetsToImageController();

  late AccountsRepository _accountsRepository;

  LockerController() {
    _accountsRepository = AccountsRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchLockers();
  }

  RxList<Locker> lockers = <Locker>[].obs;

  fetchLockers() async {
    await _accountsRepository.fetchLockers().then((value) {
      lockers.value = value.data;
      lockers.refresh();
    });
  }

  RxBool isLoading = false.obs;
  Rx<Locker> selectedLocker = Locker().obs;

  void showLockerDetails(Locker element) {
    selectedLocker = Locker().obs;
    selectedLocker.value = element;
    selectedLocker.refresh();
    Get.toNamed(
      Routes.LOCKER_DETAILS,
    );
  }

  String formatDate(var date, {String? format}) {
    if (date.runtimeType == String) {
      return DateFormat("dd MMM yy").format(DateFormat(format).parse(date));
    } else {
      return DateFormat("dd MMM yy").format(date);
    }
  }

  String formatTime(var time, {String? format}) {
    if (time.runtimeType == String) {
      return DateFormat("hh:mm a").format(DateFormat(format).parse(time));
    } else {
      return DateFormat("hh:mm a").format(time);
    }
  }
}
