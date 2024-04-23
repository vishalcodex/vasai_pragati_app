class Urls {
  // static const baseUrl = "https://smylebank-api.vercel.app/";
  static const baseUrl = "http://103.226.86.247:8888/";
  static const apiPath = "api/";

  static String getApiUrl(endpoint) {
    var url = "";
    url =
        // ignore: prefer_interpolation_to_compose_strings
        baseUrl + apiPath + endpoint;
    // (id != 0 ? "/" + id.toString() : "") +
    // (token != "" ? "?token=" + token : "");
    return url;
  }
}
