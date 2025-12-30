sealed class AppException implements Exception {
  const AppException();

  String get displayMessage => "Đã xảy ra lỗi. Vui lòng thử lại.";
}

// Lỗi mạng
class NetworkException extends AppException {
  const NetworkException();

  @override
  String get displayMessage => "Không có mạng. Vui lòng kiểm tra kết nối.";
}

// Lỗi server
class ServerException extends AppException {
  const ServerException();

  @override
  String get displayMessage => "Hệ thống đang lỗi, vui lòng thử lại sau.";
}

// Lỗi parse JSON
class ParseException extends AppException {
  const ParseException();

  @override
  String get displayMessage => "Dữ liệu không hợp lệ.";
}

// Lỗi logic nghiệp vụ
class BusinessException extends AppException {
  final String? customMessage;
  const BusinessException([this.customMessage]);

  @override
  String get displayMessage => customMessage ?? "Đã xảy ra lỗi nghiệp vụ.";
}

// Lỗi không xác định
class UnknownException extends AppException {
  const UnknownException();
  @override
  String get displayMessage => "Đã xảy ra lỗi không xác định.";
}
