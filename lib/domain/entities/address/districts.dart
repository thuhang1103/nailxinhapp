import 'package:freezed_annotation/freezed_annotation.dart';

part 'districts.freezed.dart';

@freezed
class Districts with _$Districts {
  const Districts._();

  const factory Districts({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? provinceCode,
  }) = _Districts;
}
