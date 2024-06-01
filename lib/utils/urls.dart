class URLs {
  static const String serverUrl = "fitness-calculator.p.rapidapi.com";

  static String complete(String local) {
    return serverUrl + local;
  }
}
