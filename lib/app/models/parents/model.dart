import 'dart:convert';

abstract class Model {
  late String id;

  Model() {
    id = "";
  }
  // ignore: unnecessary_null_comparison
  bool get hasData => id != null;

  void fromJson(Map<String, dynamic> json) {
    id = stringFromJson(json, 'id');
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }

  @override
  int get hashCode => this.id.hashCode;

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }

  String stringFromJson(Map<String, dynamic> json, String attribute,
      {String defaultValue = ''}) {
    try {
      // ignore: unnecessary_null_comparison
      return json != null
          ? json[attribute] != null
              ? json[attribute].toString()
              : defaultValue
          : defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  DateTime dateFromJson(Map<String, dynamic> json, String attribute,
      {DateTime? defaultValue}) {
    try {
      // ignore: unnecessary_null_comparison
      return json != null
          ? json[attribute] != null
              ? DateTime.parse(json[attribute]).toLocal()
              : defaultValue!
          : defaultValue!;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  dynamic mapFromJson(Map<String, dynamic> json, String attribute,
      {Map<dynamic, dynamic>? defaultValue}) {
    try {
      // ignore: unnecessary_null_comparison
      return json != null
          ? json[attribute] != null
              ? jsonDecode(json[attribute])
              : defaultValue!
          : defaultValue!;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  int intFromJson(Map<String, dynamic> json, String attribute,
      {int defaultValue = 0}) {
    try {
      if (json[attribute] != null) {
        if (json[attribute] is int) {
          return json[attribute];
        }
        return int.parse(json[attribute]);
      }
      return defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  double doubleFromJson(Map<String, dynamic> json, String attribute,
      {int decimal = 2, double defaultValue = 0.0}) {
    try {
      if (json[attribute] != null) {
        if (json[attribute] is double) {
          return double.parse(json[attribute].toStringAsFixed(decimal));
        }
        if (json[attribute] is int) {
          return double.parse(
              json[attribute].toDouble().toStringAsFixed(decimal));
        }
        return double.parse(
            double.tryParse(json[attribute])!.toStringAsFixed(decimal));
      }
      return defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  bool boolFromJson(Map<String, dynamic> json, String attribute,
      {bool defaultValue = false}) {
    try {
      if (json[attribute] != null) {
        if (json[attribute] is bool) {
          return json[attribute];
        } else if ((json[attribute] is String) &&
            !['0', '', 'false'].contains(json[attribute])) {
          return true;
        } else if ((json[attribute] is int) &&
            ![0, -1].contains(json[attribute])) {
          return true;
        }
        return false;
      }
      return defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  List<T> listFromJsonArray<T>(Map<String, dynamic> json,
      List<String> attribute, T Function(Map<String, dynamic>) callback) {
    String _attribute = attribute
        .firstWhere((element) => (json[element] != null), orElse: () => "");
    return listFromJson(json, _attribute, callback);
  }

  List<T> listFromJson<T>(Map<String, dynamic> json, String attribute,
      T Function(Map<String, dynamic>) callback) {
    try {
      List<T> _list = <T>[];
      if (json[attribute] != null &&
          json[attribute] is List &&
          json[attribute].length > 0) {
        json[attribute].forEach((v) {
          if (v is Map<String, dynamic>) {
            _list.add(callback(v));
          }
        });
      }
      return _list;
    } catch (e) {
      throw Exception('Error while parsing ' +
          attribute.toString() +
          '[' +
          e.toString() +
          ']');
    }
  }

  T objectFromJson<T>(Map<String, dynamic> json, String attribute,
      T Function(Map<String, dynamic>) callback,
      {T? defaultValue}) {
    try {
      if (json[attribute] != null && json[attribute] is Map<String, dynamic>) {
        return callback(json[attribute]);
      }
      return defaultValue!;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }
}
