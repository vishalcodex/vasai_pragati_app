// import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../models/account_summary_model.dart';
import '../models/ads_model.dart';
import '../models/api_response.dart';
import '../models/event_model.dart';
import '../models/interest_model.dart';
import '../models/notification_model.dart';
import '../providers/api_provider.dart';

class FeatureRepository {
  late ApiProvider apiProvider;

  FeatureRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchSliders() async {
    return await apiProvider.makeAPICall("GET", "sliders", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        if (value.data == []) {
          value.data = [];
        } else {
          List<Ads> sliders =
              (value.data as List).map((e) => Ads.fromJson(e)).toList();
          value.data = sliders;
        }
      }
      return value;
    });
  }

  Future<ApiResponse> fetchNotifications() async {
    return await apiProvider
        .makeAPICall("GET", "notifications", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        if (value.data == []) {
          value.data = [];
        } else {
          List<Notification> notifications = (value.data as List)
              .map((e) => Notification.fromJson(e))
              .toList();
          value.data = notifications;
        }
      }
      return value;
    });
  }

  Future<ApiResponse> fetchEvents() async {
    return await apiProvider.makeAPICall("GET", "event", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        List<Event> events =
            (value.data as List).map((e) => Event.fromJson(e)).toList();
        value.data = events;
      }

      return value;
    });
  }

  Future<ApiResponse> fetchNotice() async {
    return await apiProvider.makeAPICall("GET", "notice", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        // value.data = Notice.fromJson(value.data);
        value.data = value.data["description"];
      }

      return value;
    });
  }

  Future<ApiResponse> fetchSummary() async {
    return await apiProvider
        .makeAPICall("GET", "summary_details", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        List<AccountSummary> events = (value.data as List)
            .map((e) => AccountSummary.fromJson(e))
            .toList();
        value.data = events;
      }

      return value;
    });
  }

  Future<ApiResponse> fetchRateOfInterest(data) async {
    var body = data;
    // dio.FormData.fromMap(data);
    return await apiProvider
        .makeAPICall("POST", "get_intrest", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data as List).map((e) => Interest.fromJson(e)).toList();
      }

      return value;
    });
  }

  Future<ApiResponse> fetchNotifiactions() async {
    return await apiProvider
        .makeAPICall("GET", "notification", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        value.data =
            (value.data as List).map((e) => Notification.fromJson(e)).toList();
      }

      return value;
    });
  }

  Future<ApiResponse> fetchSettings() async {
    return await apiProvider.makeAPICall("GET", "settings", {}).then((value) {
      if (value.status == Status.COMPLETED) {}

      return value;
    });
  }
}
