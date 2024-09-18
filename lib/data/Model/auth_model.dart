class AuthModel {
  final String resultCode;
  final String fullName;
  final int userStatus;
  final String roleName;
  final String departName;
  final String accessToken;

  AuthModel({
    required this.resultCode,
    required this.fullName,
    required this.userStatus,
    required this.roleName,
    required this.departName,
    required this.accessToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      resultCode: json['resultCode'],
      fullName: json['full_name'],
      userStatus: json['user_status'],
      roleName: json['role_name'],
      departName: json['depart_name'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resultCode': resultCode,
      'full_name': fullName,
      'user_status': userStatus,
      'role_name': roleName,
      'depart_name': departName,
      'accessToken': accessToken,
    };
  }
}
