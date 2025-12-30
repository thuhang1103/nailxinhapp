import 'package:freezed_annotation/freezed_annotation.dart';

part 'ward.freezed.dart';

@freezed
class Ward with _$Ward {
  const Ward._();

  const factory Ward({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? districtCode,
  }) = _Ward;
}
