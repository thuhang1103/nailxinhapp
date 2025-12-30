import 'package:dio/dio.dart';
import 'appException.dart';

AppException mapDioExceptionToAppException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return const NetworkException();

    case DioExceptionType.cancel:
      return const UnknownException();

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 0;
      String? serverMsg;
      try {
        final rdata = e.response?.data;
        if (rdata is Map<String, dynamic>) {
          serverMsg = (rdata['message'] ?? rdata['error'] ?? rdata['msg'])
              ?.toString();
        } else if (rdata is String) {
          serverMsg = rdata;
        }
      } catch (_) {}
      if (statusCode >= 500) {
        return const ServerException();
      } else {
        return BusinessException(serverMsg ?? 'Lỗi server: $statusCode');
      }

    case DioExceptionType.unknown:
    default:
      return const UnknownException();
  }
}

String mapMembershipLevel(String? en) {
  if (en == null) return '—';
  switch (en.toLowerCase()) {
    case 'bronze':
      return 'Đồng';
    case 'silver':
      return 'Bạc';
    case 'gold':
      return 'Vàng';
    case 'platinum':
      return 'Bạch kim';
    case 'diamond':
      return 'Kim cương';
    default:
      return en; // nếu muốn giữ nguyên chuỗi gốc khi không khớp
  }
}
