class AppConstants {
  static const String appName = 'Demo App';
  static const double appVersion = 1.0;

  // Shared Preference Key
  static const String token = 'token';
  static const String user = 'user';

// BASE URL
  // static const String apiBaseUrl = 'http://157.245.109.105:8000/';
  // static const String mediaBaseUrl = 'http://157.245.109.105:8000';

  static const String apiBaseUrl = 'http://192.168.130.68:8000/';
  static const String mediaBaseUrl = 'http://192.168.130.68:8000';

  // static const String apiBaseUrl = 'http://192.168.1.125:8000/';
  // static const String mediaBaseUrl = 'http://192.168.1.125:8000';

  //   static const String apiBaseUrl = 'http://192.168.0.166:8000/';
  // static const String mediaBaseUrl = 'http://192.168.0.166:8000';

// ENDPOINTS URLS
  static const String registerUrl = 'user-management/register-user';
  static const String loginUrl = 'user-management/login-user';
  static const String getHospital = 'hospital-management/create-get-hospital';
  static const String updateHospital = 'hospital-management/update-delete-hospital';
   


  // static List<LanguageModel> languages = [
  //   LanguageModel(imageUrl: Images.unitedKingdom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
  //   LanguageModel(imageUrl: Images.arabic, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  // ];

  static const String imageFromAsset = 'fromAsset';
  static const String imageFromNetwork = 'fromNetwork';
  static const String imageFromSelectedFile = 'Welcome';










  static List<String> regions = [
    "Arusha",
    "Dar es Salaam",
    "Dodoma",
    "Geita",
    "Iringa",
    "Kagera",
    "Katavi",
    "Kigoma",
    "Kilimanjaro",
    "Lindi",
    "Manyara",
    "Mara",
    "Mbeya",
    "Morogoro",
    "Mtwara",
    "Mwanza",
    "Njombe",
    "Pemba North",
    "Pemba South",
    "Pwani",
    "Rukwa",
    "Ruvuma",
    "Shinyanga",
    "Simiyu",
    "Singida",
    "Tabora",
    "Tanga",
    "Zanzibar Central/South",
    "Zanzibar North",
    "Zanzibar Urban/West"
  ];
}
