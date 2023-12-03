extension StringExtension on String {
  bool get isEmail {
    const p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(p);
    return regExp.hasMatch(this);
  }

  bool get isPhoneValid {
    const p = r'^[0-9]{1,}$';
    final regExp = RegExp(p);
    return regExp.hasMatch(this);
  }

  bool get isPasswordValid => length >= 8;

  bool compared(String text) => this == text;

  String get stringToImageUrl => 'https://image.tmdb.org/t/p/w500/$this';
  Uri get stringToUri => Uri.parse('https://api.themoviedb.org/3/$this?api_key=fd4c25c2f0665141e89d2d389472f84e');
}
