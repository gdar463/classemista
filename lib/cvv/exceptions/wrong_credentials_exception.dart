class WrongCredentialsExcpetion implements Exception {
  final String? uid;
  final String? pass;

  WrongCredentialsExcpetion({required this.uid, required this.pass});

  @override
  String toString() {
    return "Wrong Credentials\nuid: $uid\npass: $pass";
  }
}
