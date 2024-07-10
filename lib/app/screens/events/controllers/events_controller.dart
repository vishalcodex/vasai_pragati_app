import 'package:get/get.dart';

import '../../../models/event_model.dart';
import '../../../repositories/feature_repository.dart';
import '../../../routes/app_routes.dart';

class EventsController extends GetxController {
  late FeatureRepository _featureRepository;
  EventsController() {
    _featureRepository = FeatureRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  RxBool isLoading = false.obs;
  RxList<Event> events = <Event>[].obs;

  void fetchEvents() async {
    isLoading.value = true;
    await _featureRepository.fetchEvents().then((value) {
      isLoading.value = false;
      events.value = value.data;
      events.refresh();
    });
  }

  void onEventClicked(var e) {
    selectedValue = Event().obs;
    selectedValue.value = e;
    selectedValue.refresh();
    Get.toNamed(Routes.EVENTS_DETAILS);
  }

  Rx<Event> selectedValue = Event().obs;
}
