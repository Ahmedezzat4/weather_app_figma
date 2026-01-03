import 'package:intl/intl.dart';

todayDate(String dataTimeString) {
  DateTime dateTime = DateTime.parse(dataTimeString);

  String formattedDate = DateFormat('d MMM').format(dateTime);
  return formattedDate;
}

hourParth(String dataTimeString) {
  DateTime dateTime = DateTime.parse(dataTimeString);

  String formattedDate = DateFormat('HH:mm').format(dateTime);
  return formattedDate;
}

dayParth(String dataTimeString) {
  DateTime dateTime = DateTime.parse(dataTimeString);

  String formattedDate = DateFormat('EEE').format(dateTime);
  return formattedDate;
}

String imageUrlParth(String imagePath) {
  return 'https:$imagePath';
}

String getUvLevelDescription(double uv) {
  if (uv >= 0 && uv <= 2) {
    return "Low";
  } else if (uv >= 3 && uv <= 5) {
    return "Moderate";
  } else if (uv >= 6 && uv <= 7) {
    return "High";
  } else if (uv >= 8 && uv <= 10) {
    return "Very High";
  } else if (uv >= 11) {
    return "Extreme";
  } else {
    return "Invalid UV value";
  }
}
