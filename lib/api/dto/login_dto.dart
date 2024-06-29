class LoginParameters {
  final String login;
  final String pwd;

  LoginParameters({
    required this.login,
    required this.pwd,
  });

  factory LoginParameters.fromJson(Map<String, dynamic> json) =>
      LoginParameters(
        login: json['login'],
        pwd: json['pwd'],
      );
}
