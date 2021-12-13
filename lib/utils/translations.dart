class Translations {
  static final languages = ['English', 'French', 'Arabic'];
  static final langflags = <String?, String>{
    'English': 'assets/eng.png',
    'French': 'assets/fr.png',
    'Arabic': 'assets/tn.png'
  };

  static String getLanguageCode(String? language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'French':
        return 'fr';
      case 'Arabic':
        return 'ar';
      default:
        return 'en';
    }
  }
}
