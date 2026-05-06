class AuthRespone {
  final bool? success;
  final Data? data;

  AuthRespone({required this.success, required this.data});

  factory AuthRespone.fromJson(Map<String, dynamic> json) =>
      AuthRespone(success: json['success'] as bool?, data: json['data'] != null ? Data.fromJson(json['data']) : null);
}

class Data {
  final String token_type;
  final int expires_in;
  final String access_token;

  Data({
    required this.token_type,
    required this.expires_in,
    required this.access_token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token_type: json['token_type'],
    expires_in: json['expires_in'],
    access_token: json['access_token'],
  );
}
