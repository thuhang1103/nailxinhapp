abstract class PointEvent {}

/// Khi vào trang Point
class LoadPointData extends PointEvent {}

/// Nhấn nút nhận điểm hằng ngày
class ReceiveDailyPoints extends PointEvent {}

/// Nhấn nút quay vòng quay
class SpinLuckyWheel extends PointEvent {}

/// Clear kết quả quay sau khi show dialog
class ClearSpinResult extends PointEvent {}
