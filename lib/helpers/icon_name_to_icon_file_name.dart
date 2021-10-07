class IconNameToIconFileName {
  static String get(String iconName) {
    if (iconName == "clear-day") return "assets/clear.png";
    if (iconName == "clear-night") return "assets/nt_clear.png";
    if (iconName == "rain") return "assets/rain.png";
    if (iconName == "snow") return "assets/snow.png";
    if (iconName == "sleet") return "assets/sleet.png";
    if (iconName == "wind") return "assets/cloudy.png";
    if (iconName == "fog") return "assets/fog.png";
    if (iconName == "cloudy") return "assets/cloudy.png";
    if (iconName == "partly-cloudy-day") return "assets/partlycloudy.png";
    if (iconName == "partly-cloudy-night") return "assets/nt_partlycloudy.png";
    if (iconName == "hail") return "";
    if (iconName == "thunderstorm") return "";
    if (iconName == "tornado") return "";

    return "";
  }
}
