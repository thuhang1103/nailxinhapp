import 'package:freezed_annotation/freezed_annotation.dart';

part 'provinces.freezed.dart';

@freezed
class Provinces with _$Provinces {
  const Provinces._();

  const factory Provinces({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? phoneCode,
  }) = _Provinces;
}
